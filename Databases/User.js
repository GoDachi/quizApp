const {con} = require("./main.js");
 

function dataInserter(data){
    const sql = 'INSERT INTO user VALUES (' + data.user_id + ',"' + data.user_name + '","'  + data.user_mail + '","'  + data.user_password + '","' + data.user_avtar + '",' + data.is_admin + ',"' + data.created_at + '");';
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("1 record inserted");
    });
}

function dataDeleter(id){
    const sql = "DELETE FROM user WHERE user_id = " + id + ";";
    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Number of records deleted: " + result.affectedRows);
    });
}

function dataFinder(id){
    con.query("SELECT * FROM user WHERE user_id = " + id + ";", function (err, result) {
      if (err) throw err;
      console.log(result);
    });
}

function updater(id , obj){
    let start = 0;
    let sql = " UPDATE user SET ";
    for(const [key , value] of Object.entries(obj)){
      if(start != 0)sql += ',';
      else start = 1;
      sql += '' + key + '="' + value + '"';
    }
    sql+= ' WHERE user_id =' + id + ";";

    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Number of records deleted: " + result.affectedRows);
    });
}
//dataDeleter(1);
//dataFinder(1);
// dataInserter({
//   user_id: "1", 
//   user_name: "something",
//   user_password: "123",
//   user_avtar: "any",
//   is_admin: 1,
//   created_at: '9999-12-31',
//   user_mail: "any@gmail.com"
// });
// updater(1 , {user_password: "nothing" , user_name: "name" , user_id: 2});

// dataFinder(2);
con.end();

