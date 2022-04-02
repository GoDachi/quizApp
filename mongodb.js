
const MongoClient = require('mongodb').MongoClient;
const assert = require('assert');

// Connection URL
const url = 'mongodb://localhost:27017';

// Database Name
const dbName = 'myproject';

// Use connect method to connect to the server
function dataInserter(myobj){
  MongoClient.connect(url, function(err, client) {
    if(err) console.log(err);
    var dbo=client.db("mydb");
    // var myobj={name:"shivam",surename:"kuamr"};

    dbo.collection("details").insertOne(myobj,function(err,res)
    {
      if(err) throw err;
      console.log("data entered");
      client.close();
    });

  });
}

exports.dataInserter = dataInserter;
