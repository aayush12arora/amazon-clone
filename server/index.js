// IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");

// INIT
const PORT = process.env.PORT || 3000;
const app = express();
const DB =
  "mongodb+srv://aayush12arora:amazonclone@cluster0.jgmuxrw.mongodb.net/?retryWrites=true&w=majority";

// IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");
 
// middleware

app.use(cors());
app.use(express.json());
app.use(authRouter)
  // Connections
mongoose
.connect(DB)
.then(() => {
  console.log("Connection Successful");
})
.catch((e) => {
  console.log(e);
});


app.listen(PORT, "0.0.0.0", () => {
console.log(`connected at port ${PORT}`);
});