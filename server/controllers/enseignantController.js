const express = require("express");
const router = express.Router();
const Enseignant = require("../models/Enseignant");

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
  try {
    const email = req.body[0].contact_info.email;
    const existe = await Enseignant.find({ "contact_info.email": email });
    if (existe.length > 0) {
      res
        .status(201)
        .json({ data: [], message: "Cette email est deja utilisé" });
    } else {
      const enseignant = await Enseignant.create(req.body);
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
