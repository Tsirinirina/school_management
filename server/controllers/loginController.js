const express = require("express");
const router = express.Router();
const Enseignant = require("../models/Enseignant");

router.post("/", async (req, res) => {
  const { username, password } = req.body;
  try {
    console.log(req.body);
    const enseignant = await Enseignant.findOne({ username });
    if (!enseignant) {
      console.log({
        message: "Le nom d'utilisateur est incorrect ou n'existe pas",
      });
      return res.status(401).json({
        message: "Le nom d'utilisateur est incorrect ou n'existe pas",
      });
    } else {
      if (enseignant.password !== password) {
        console.log({ message: "Mot de passe incorrect" });
        return res.status(401).json({ message: "Mot de passe incorrect" });
      }
      console.log({ message: "Connexion réussie" });
      return res.status(200).json({ message: "Connexion réussie", enseignant });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

module.exports = router;
