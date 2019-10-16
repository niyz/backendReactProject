/** 
 * Server
 */

const express = require('express');
var app = express();

app.use(express.json())
var path = require('path');

app.listen(process.env.PORT || 8080)


/**
 * Get and postmappings
 */

app.get('/', (req,res) => {
    res.sendFile(path.join(__dirname + '/index.html'))
});

app.get('/user/:user_id', (req,res) => {
    var userId = req.params.user_id;
    console.log(userId)
    var sqlQuery = "SELECT * FROM user WHERE user_id = " + userId +";";
    dbFunctions(sqlQuery);
})

app.get('/restaurant/:restaurant_id', (req,res) => {
    let resturantId = req.params.restaurant_id;
    let sqlQuery =  "SELECT * FROM restaurant WHERE restaurant_id = " + resturantId +";";
    dbFunctions(sqlQuery);
    res.send(200);
})

app.get('/review/restaurant/:restaurant_id', (req,res) => {
    var restId = req.params.restaurant_id;
    console.log(restId)
    var sqlQuery = "SELECT * FROM review WHERE restaurant_id = " + restId +";"; 
    console.log(restId)
    dbFunctions(sqlQuery);
   
})

app.get('/review/latest/', (req,res) => {

    let sqlQueryS = "SELECT * FROM review ORDER BY updated_at DESC";
    dbFunctions(sqlQueryS);
    res.send(200);

})


app.post('/user/update', (req,res) => {

    let sqlQuery = "UPDATE user SET username =" + "'" + req.body.username + "'" + ", email =" + "'" + req.body.email
        + "'" + ", password =" + "'" + req.body.password + "'" + ", role=" + "'" + req.body.role + "'"
        + ", updated_at = '" + dateFunc() + "' WHERE user_id = " + req.body.user_id + ";";
  
    res.send(200);
    dbFunctions(sqlQuery);
} )

app.post('/user/create', (req, res) => {
    let sqlQuery = "INSERT INTO user(username,email,password,role,created_at, updated_at,active) VALUES" +
        "(" + "'" + req.body.username + "'," + "'" + req.body.email + "'," + "'" + req.body.password + "'," +
        "'" + req.body.role + "'," + "'" + dateFunc() + "'," + "'" + dateFunc() + "'," + "'" + 1 + "');";
    dbFunctions(sqlQuery);
    res.send(200);
})

app.post('/review/update', (req, res) => {

    let sqlQuery = "UPDATE review SET " + "user_id =" + req.body.user_id + ", restaurant_id =" + req.body.restaurant_id + ", rating=" + req.body.rating + ", review_text = '" + req.body.reviewText + "', updated_at='" + dateFunc() + "' WHERE review_id = " + req.body.review_id + ";";
  
    dbFunctions(sqlQuery);
    res.send(200);
})

app.post('/review/create', (req, res) => {
    let sqlQuery = "INSERT INTO review (rating, review_text, created_at, updated_at, active, user_id, restaurant_id) VALUES (" + "'" 
    +req.body.rating + "', " + "'" + req.body.reviewText + "', '" + dateFunc() + "', '" + dateFunc() + "', '" + 1 + "', '" + req.body.user_id + "', '" + req.body.restaurant_id + "');";
    
  
    dbFunctions(sqlQuery);
    res.send(200);
})

app.post('/restaurant/update', (req, res) => {

    let sqlQuery = "UPDATE restaurant SET " + "user_id =" + req.body.user_id + ", name ='" + req.body.name + "', description='" + req.body.description + "', category = '" + req.body.category + "', updated_at='"+ dateFunc() +"' WHERE restaurant_id = " + req.body.restaurant_id + ";";
  
    dbFunctions(sqlQuery);
    res.send(200);

})

app.post('/restaurant/create', (req, res) => {
  
    let active = 1;
    let sqlQuery = "INSERT INTO restaurant (name, address, description,category, created_at, updated_at, active, user_id) VALUES ('" + req.body.name + "', '" + req.body.address + "', '" + req.body.description + "' , '" + req.body.category + "' , '" + dateFunc() + "', '"+ dateFunc() + "', " + active +", " + req.body.user_id + ");" ;

    dbFunctions(sqlQuery);
    res.send(200);
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
            database: "grouptask_db"
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

