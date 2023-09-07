const express = require("express");
const app = express();
const cors = require("cors");
const mongoose = require("mongoose");
const port = 3000;
const dotenv = require("dotenv");
dotenv.config();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());
app.use(cors());

const indexC = require("./controllers/indexController");
const etudiantC = require("./controllers/etudiantController");
const enseignantC = require("./controllers/enseignantController");
const classeC = require("./controllers/classeController");
const loginC = require("./controllers/loginController");

app.use(indexC);
app.use("/api/etudiant", etudiantC);
app.use("/api/enseignant", enseignantC);
app.use("/api/classe", classeC);
app.use("/api/login", loginC);

const dbUrl = `${process.env.MONGODB_URI}${process.env.BD_NAME}`;
const dburl2 = `${process.env.MONGODB_CLUSTER8URI}${process.env.BD_NAME}`;
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
