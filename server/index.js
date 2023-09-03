const express = require("express");
const app = express();
const cors = require("cors");
const mongoose = require("mongoose");
const port = 3000;

app.get("/", (req, res) => {
  res.send("Salut");
});

app.listen(port, () => {
  console.log(`Serveur démarré sur http://127.0.0.1:${port}`);
});
