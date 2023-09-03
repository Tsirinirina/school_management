const mongoose = require("mongoose");

const questionSchema = mongoose.Schema(
  {
    matiere: { type: mongoose.Schema.ObjectId, ref: "Matiere" },
    question: { type: String, required: true },
    option: [String],
    reponse: String,
    piece_joint: String,
  },
  { timestamps: true }
);

const question = mongoose.model("Question", questionSchema);

module.exports = question;
