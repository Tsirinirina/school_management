const mongoose = require("mongoose");

const leconSchema = mongoose.Schema(
  {
    titre: { type: String, required: true },
    enseignant: { type: mongoose.Schema.ObjectId, ref: "Enseignant" },
    contenue: [{ sous_titre: String, paragraphe: String }],
    topics: [
      {
        titre: String,
        cotenue: String,
        order: Number,
      },
    ],
  },
  { timestamps: true }
);

const lecon = mongoose.model("Lecon", leconSchema);

module.exports = lecon;
