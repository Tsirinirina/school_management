const mongoose = require("mongoose");

const coursSchema = mongoose.Schema(
  {
    matiere: { type: mongoose.Schema.ObjectId, ref: "Matiere" },
    horaire: { jour: String, heure_debut: String, heure_fin: String },
  },
  { timestamps: true }
);

const cours = mongoose.model("Cours", coursSchema);

module.exports = cours;
