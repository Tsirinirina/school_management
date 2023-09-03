const mongoose = require("mongoose");

const enseignantSchema = mongoose.Schema(
  {
    nom: { type: String, required: [true, "Le nom ne doit pas être vide"] },
    prenom: { type: String, required: [true, "Le prénom doit pas être vide"] },
    contact_info: {
      telephone: [String],
      email: { type: String, unique: true },
    },
    adresse: String,
    date_embauche: {
      type: Date,
      required: [true, "Le date ne doit pas être vide"],
    },
    username: {
      type: String,
      required: [true, "Le pseudo ne doit pas être vide"],
    },
    password: {
      type: String,
      required: [true, "Le mot de passe ne doit pas être vide"],
    }, //VIA token_base
  },
  { timestamps: true }
);

const enseignant = mongoose.model("Enseignant", enseignantSchema);

module.exports = enseignant;
