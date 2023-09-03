const mongoose = require("mongoose");

const classeSchema = mongoose.Schema(
  {
    nom: { type: String, required: true },
    responsable: { type: mongoose.Schema.ObjectId, ref: "Enseignant" },
  },
  { timestamps: true }
);

const classe = mongoose.model("Classe", classeSchema);

module.exports = classe;
