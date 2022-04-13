const {con} = require("./main.js");

function dataInserter(data){
  const sql = 'INSERT INTO question VALUES (' + data.ques_id + ',"' + data.ques_text + '","'  + data.quiz_id + '","'  + data.ans_id + '","' + data.points + '");';
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("1 record inserted");
  });
}

function dataDeleter(id){
  const sql = "DELETE FROM question WHERE ques_id = " + id + ";";
  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
  });
}

function dataFinder(id){
  con.query("SELECT * FROM question WHERE ques_id = " + id + ";", function (err, result) {
    if (err) throw err;
    console.log(result);
  });
}

function updater(id , obj){
  let start = 0;
  let sql = " UPDATE question SET ";
  for(const [key , value] of Object.entries(obj)){
    if(start != 0)sql += ',';
    else start = 1;
    sql += '' + key + '="' + value + '"';
  }
  sql+= ' WHERE ques_id =' + id + ";";

  con.query(sql, function (err, result) {
    if (err) throw err;
    console.log("Number of records deleted: " + result.affectedRows);
  });
}


// dataDeleter(1);
// dataFinder(1);
// dataInserter({
//   ques_id: "1", 
//   ques_text: "something",
//   quiz_id: "123",
//   ans_id: "2",
//   points: 1,
//   created_at: '9999-12-31',
//   user_mail: "any@gmail.com"
// });
// updater(1 , {ques_text: "nothing" , points: 5});

// dataFinder(1);
con.end();