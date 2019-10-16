const express = require('express');
var app = express();
//var test = require("./database.js");


var path = require('path');

app.get('/', (req,res) => {
    res.sendFile(path.join(__dirname + '/index.html'))
});

app.listen(process.env.PORT || 8080)


app.get('/user/:user_id', (req,res) => {
    var userId = req.params.user_id;
    console.log(userId)
    var sqlQuery = "SELECT * FROM user WHERE user_id = " + userId +";"; 
    dbFunctions(sqlQuery);
    // Fixa user_id https://stackoverflow.com/questions/17007997/how-to-access-the-get-parameters-after-in-express
})


/*---------------- Test ------------*/

var mysql = require('mysql');
var something;
function connectToDb() {
    var con = mysql.createConnection(
        {
            host: "localhost", 
            port: "3306", 
            user: "root", 
            password: "", 
            database: "databasegroup"
        }
    );
    console.log("Connected");
    return con;    

}

function closeDb(con) {
    con.end();
}


function insertIntoDB() {
    let con = connectToDb();

    let insertQuery = "INSERT INTO user (user_id, username, email, password, role, created_at,  updated_at, active) VALUES (null, 'Tjenafan', 'email@asdads.com', '123213', 1, '2019-10-03 08:11:43', '2019-10-14 17:22:36', '1')"

    con.query(insertQuery, function (err, result) {
        if (err) throw err;
        console.log("result:" + JSON.stringify(result));
        
    });

    closeDb(con)
}

function dbFunctions(sqlQuery) {
    let con = connectToDb();
    console.log(sqlQuery)

    con.query(sqlQuery, function (err, result) {
        if (err) throw err;
        console.log("result:" + JSON.stringify(result));
        
    });

    closeDb(con)
}

