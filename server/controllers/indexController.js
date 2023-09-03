const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.send(
    "<div><h2>Bienvenue dans le serveur de school management</h2></div> "
  );
});

module.exports = router;
