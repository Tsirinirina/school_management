const express = require("express");
const router = express.Router();
const Classe = require("../models/Classe");

router.get("/", async (req, res) => {
  try {
    const classe = await Classe.find().populate("responsable");
    res.status(200).json(classe);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: error.message });
  }
});

router.post("/", async (req, res) => {
  try {
    const nomClasse = req.body.nom;

    const existe = await Classe.find({ nom: nomClasse });
    if (existe.length > 0) {
      res.status(500).json({ data: [], message: "Cette existe déjà" });
    } else {
      const classe = await Classe.create(req.body);
      res.status(201).json({ data: classe, message: "Classe ajouté" });
    }
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: error.message });
  }
});

router.get("/:id", async (req, res) => {
  try {
    const classe = await Classe.findById(req.params.id);
    if (!classe) {
      res.status(400).json({ message: "Aucun données trouvé" });
    } else {
      res.status(200).json(classe);
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

module.exports = router;
