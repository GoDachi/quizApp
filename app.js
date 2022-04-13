const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const https = require("https");
const {dataInserter} = require("./mongodb.js");
app.use(bodyParser.urlencoded({extended: true}));

app.use(express.static("public"));

app.post("/" , (req , res) => {
  const firstName = req.body.firstName;
  const lastName = req.body.lastName;
  const email = req.body.email;
  const password = req.body.password;
  res.redirect("/admin");
});

app.get("/admin" , (req , res) => {
  res.sendFile(__dirname + "/quizForm.html");
});

app.post("/admin" , (req , res) => {
  const obj = { ques: req.body.Question , op1: req.body.Option1 , op2: req.body.Option2 , op3: req.body.Option3 , op4: req.body.Option4};
  dataInserter(obj);
});

app.get("/" , (req , res) => {
  res.sendFile(__dirname + "/signup.html");
});

app.listen(3000 , () => {
  console.log("server is running at port 3000")
});
