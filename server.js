const express = require('express');
var app = express();
//var test = require("./database.js");

app.use(express.json())
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

app.get('/restaurant/:restaurant_id', (req,res) => {
    //TODO: Pär
})

app.get('/review/restaurant/:restaurant_id', (req,res) => {
    var restId = req.params.restaurant_id;
    console.log(restId)
    var sqlQuery = "SELECT * FROM review WHERE restaurant_id = " + restId +";"; 

    console.log(restId)
    dbFunctions(sqlQuery);
    //TODO: Simon
})

app.get('/review/latest/', (req,res) => {
    //TODO: Maria
})


app.post('/user/update', (req,res) => {

    let sqlQuery = "UPDATE user SET username =" + "'" + req.body.username + "'" + ", email =" + "'" + req.body.email + "'" + ", password =" + "'" + req.body.password + "'" + ", role=" + "'" + req.body.role + "'" + ", updated_at = '" + dateFunc() + "' WHERE user_id = " + req.body.user_id + ";";
  
    //console.log(sqlQuery);
    res.send("Works..");
    dbFunctions(sqlQuery);
} )
app.post('/user/create', (req, res) => {
    //TODO: Pär
})

app.post('/review/update', (req, res) => {

    let sqlQuery = "UPDATE review SET " + "user_id =" + req.body.user_id + ", restaurant_id =" + req.body.restaurant_id + ", rating=" + req.body.rating + ", review_text = '" + req.body.reviewText + "' WHERE review_id = " + req.body.review_id + ";";
  
    res.send("Works..");
    dbFunctions(sqlQuery);
    //TODO: Simon
})
app.post('/review/create', (req, res) => {
    //TODO: Maria
})

app.post('/restaurant/update', (req, res) => {
    //TODO: Pär

    let sqlQuery = "UPDATE restaurant SET " + "user_id =" + req.body.user_id + ", name ='" + req.body.name + "', description='" + req.body.description + "', category = '" + req.body.category + "' WHERE restaurant_id = " + req.body.restaurant_id + ";";
  
    res.send("Works..");
    console.log(sqlQuery);
    dbFunctions(sqlQuery);
    //TODO: Simon

})
app.post('/restaurant/create', (req, res) => {
    let active = 1;

    let sqlQuery = "INSERT INTO restaurant (name, address, description,category, created_at, active, user_id) VALUES ('" + req.body.name + "', '" + req.body.address + "', '" + req.body.description + "' , '" + req.body.category + "' , '" + dateFunc() + "', " + active +", " + req.body.user_id + ");" ;

    console.log(sqlQuery);
    res.send("Works..");
    dbFunctions(sqlQuery);
    //TODO: Simon
})



/* ---------Help Functions-------  */

function dateFunc() {

    var date;
    date = new Date();
    date = date.getUTCFullYear() + '-' +
        ('00' + (date.getUTCMonth()+1)).slice(-2) + '-' +
        ('00' + date.getUTCDate()).slice(-2) + ' ' + 
        ('00' + date.getUTCHours()).slice(-2) + ':' + 
        ('00' + date.getUTCMinutes()).slice(-2) + ':' + 
        ('00' + date.getUTCSeconds()).slice(-2);

    return date;
}

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


function dbFunctions(sqlQuery) {
    let con = connectToDb();
    console.log(sqlQuery)

    con.query(sqlQuery, function (err, result) {
        if (err) throw err;
        console.log("result:" + JSON.stringify(result));
        
    });

    closeDb(con)
}

