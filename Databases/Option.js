const {con} = require("./main");

function optionIn(data){

    const sql="INSERT INTO option_s VALUE ('" + data.option_id + "','" + data.ques_id + "','" + data.option_text + "');"
    con.query(sql,function(err,result){
        if(err) throw err;
        console.log("Option is inserted");
    })
}

function optionDel(id,opid){
    
    const sql="DELETE FROM option_s WHERE ques_id = "+ id + " AND option_id = " + opid + ";";
    con.query(sql,function(err,result){
        if(err) throw err;
        console.log("Option delete "+result.affecterdRows);
    })
}
function optionFinder(id,opid){
    con.query("SELECT * FROM option_s WHERE ques_id = '" + id + "' AND option_id = '" + opid + "';", function (err, result) {
      if (err) throw err;
      console.log(result);
    });
}

function optionUpdater(id ,opid , obj){
    let start = 0;
    let sql = " UPDATE option_s SET ";
    for(const [key , value] of Object.entries(obj)){
      if(start != 0)sql += ',';
      else start = 1;
      sql += '' + key + '="' + value + '"';
    }
    sql+= ' WHERE ques_id =' + id + " AND option_id = " + opid + ";";

    con.query(sql, function (err, result) {
      if (err) throw err;
      console.log("Number of records deleted: " + result.affectedRows);
    });
}

// optionIn({
//   option_id:"1234",
//   ques_id:"3210",
//   option_text:"50"
// });
// optionDel("123","321");
// optionFinder("3210","1234");

// optionUpdater("3210","1234",{
//   option_text:"100"
// });
// optionFinder("3210","1234");





con.end();