const mongoose = require("mongoose");

const classeSchema = mongoose.Schema(
  {
    nom: { type: String, required: [true, "Le classe doit avoir un nom"] },
    responsable: {
      type: mongoose.Schema.ObjectId,
      ref: "Enseignant",
      required: [true, "Le classe doit avoir un responsable"],
    },
  },
  { timestamps: true }
);

const classe = mongoose.model("Classe", classeSchema);

module.exports = classe;
