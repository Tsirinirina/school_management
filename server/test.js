const bcrypt = require("bcrypt");

const crypter = async () => {
  const mdp = "jeanandre";
  const saltRounds = 10;
  const hashedPassword = await bcrypt.hash(mdp, saltRounds);
  console.log(hashedPassword);
};
crypter();
