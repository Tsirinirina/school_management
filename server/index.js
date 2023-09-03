const express = require("express");
const app = express();
const cors = require("cors");
const mongoose = require("mongoose");
const port = 3000;
const dotenv = require("dotenv");
dotenv.config();

app.use(express.json());
app.use(cors());

const indexC = require("./controllers/indexController");

app.use(indexC);

const dbUrl = `${process.env.MONGODB_URI}${process.env.BD_NAME}`;

mongoose
  .connect(dbUrl)
  .then(() => {
    console.log(`Base de données connecté`);
    app.listen(port, () => {
      console.log(`Serveur démarré sur http://127.0.0.1:${port}`);
    });
  })
  .catch((err) => {
    console.log(err);
  });
