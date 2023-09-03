const mongoose = require("mongoose");

const noteSchema = mongoose.Schema(
  {
    nom: String,
    etudiant: mongoose.Schema.ObjectId,
    note: { type: Number, default: 0 },
  },
  { timestamps: true }
);

const note = mongoose.model("Note", noteSchema);

module.exports = note;
