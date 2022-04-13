const {con} = require("./main.js");

function dataInserter(data){
  const sql = 'INSERT INTO quiz VALUES (' + data.quiz_id + ',"' + data.quiz_name + '","'  + data.Description + '");';
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
}

function dataDeleter(id){
  const sql = "DELETE FROM quiz WHERE quiz_id = " + id + ";";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
  });
}

function dataFinder(id){
  con.query("SELECT * FROM quiz WHERE quiz_id = " + id + ";", function (err, result) {
    if (err) throw err;
    console.log(result);
  });
}

function updater(id , obj){
  let start = 0;
  let sql = " UPDATE quiz SET ";
  for(const [key , value] of Object.entries(obj)){
    if(start != 0)sql += ',';
    else start = 1;
    sql += '' + key + '="' + value + '"';
  }
  sql+= ' WHERE quiz_id =' + id + ";";

  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
  });
}

//  dataDeleter(1);
// dataFinder(1);
// dataInserter({
//   quiz_id: "1",
//   quiz_name: "maths",
//   Description:"tough"
// });
// updater(1 , {Description: "easy"});

// dataFinder(1);
con.end();