const mongoose = require("mongoose");

const etudiantSchema = mongoose.Schema(
  {
    nom: { type: String, required: true },
    prenom: { type: String, required: true },
    date_naissance: { type: Date, required: true },
    class_recent: { type: mongoose.Schema.ObjectId, ref: "Classe" },
    parent_info: {
      pere: String,
      profession_pere: String,
      numero_pere: String,
      mere: String,
      profession_mere: String,
      numero_mere: String,
    },
    date_inscrit: Date,
  },
  { timestamps: true }
);

const etudiant = mongoose.model("Etudiant", etudiantSchema);

module.exports = etudiant;
