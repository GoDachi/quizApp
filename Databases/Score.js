const {con} = require("./main.js");

function dataInserter(data){
  const sql = 'INSERT INTO score VALUES (' + data.quiz_id + ',"' + data.user_id + '","'  + data.score + '");';
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
}

function dataDeleter(q_id , u_id){
  const sql = "DELETE FROM score WHERE quiz_id = " + q_id + " AND user_id = " + u_id + ";";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
  });
}

function dataFinder(q_id , u_id){
  con.query("SELECT * FROM score WHERE quiz_id = " + q_id + " AND user_id = " + u_id + ";", function (err, result) {
    if (err) throw err;
    console.log(result);
  });
}

function updater(q_id , u_id , obj){
  let start = 0;
  let sql = " UPDATE score SET ";
  for(const [key , value] of Object.entries(obj)){
    if(start != 0)sql += ',';
    else start = 1;
    sql += '' + key + '="' + value + '"';
  }
  sql+= " WHERE quiz_id = " + q_id + " AND user_id = " + u_id + ";";

  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
  });
}

// dataDeleter(1 , 1);
// dataFinder(1 , 1);
// dataInserter({
//   quiz_id: 1, user_id: 1 , score: 5
// });
// updater(1 , 1 , {score: 10});

// dataFinder(1 , 1);
con.end();