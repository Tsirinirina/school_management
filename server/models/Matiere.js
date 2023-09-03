const mongoose = require("mongoose");

const matiereSchema = mongoose.Schema(
  {
    nom: String,
    enseignant: mongoose.Schema.ObjectId,
    classe: [{ type: mongoose.Schema.ObjectId, ref: "Classe" }],
    coefficient: Number,
  },
  { timestamps: true }
);

const matiere = mongoose.model("Matiere", matiereSchema);

module.exports = matiere;
