const express = require("express");
const router = express.Router();
const Etudiant = require("../models/Etudiant");

router.get("/", async (req, res) => {
  try {
    const etudiant = await Etudiant.find();
    res.status(200).json(etudiant);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: error.message });
  }
});

module.exports = router;
