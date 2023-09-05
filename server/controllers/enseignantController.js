const express = require("express");
const router = express.Router();
const Enseignant = require("../models/Enseignant");
const bcrypt = require("bcrypt");

router.get("/", async (req, res) => {
  try {
    const enseignant = await Enseignant.find();
    res.status(200).json(enseignant);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: error.message });
  }
});

router.post("/", async (req, res) => {
  const {
    nom,
    prenom,
    contact_info,
    adresse,
    date_embauche,
    username,
    password,
  } = req.body;
  try {
    const email = contact_info.email;
    const existe = await Enseignant.find({ "contact_info.email": email });
    if (existe.length > 0) {
      res
        .status(201)
        .json({ data: [], message: "Cette email est deja utilisé" });
    } else {
      const saltRounds = 10;
      const hashedPassword = await bcrypt.hash(password, saltRounds);
      const enseignant = new Enseignant({
        nom,
        prenom,
        contact_info,
        adresse,
        date_embauche,
        username,
        password: hashedPassword, // Enregistrez le mot de passe haché
      });
      await enseignant.save();
      res.status(201).json({ data: enseignant, message: "Enseignant ajouté" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: error.message });
  }
});

router.get("/:id", async (req, res) => {
  try {
    const enseignant = await Enseignant.findById(req.params.id);
    if (!enseignant) {
      res.status(400).json({ message: "Aucun données trouvé" });
    } else {
      res.status(200).json(enseignant);
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

module.exports = router;
