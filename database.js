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


function insertIntoDB(insertQuery) {
    let con = connectToDb();
    //let insertQuery = "INSERT INTO user (user_id, username, email, password, role, created_at,  updated_at, active) VALUES (null, 'Tjenafan', 'email@asdads.com', '123213', 1, '2019-10-03 08:11:43', '2019-10-14 17:22:36', '1')"

    con.query(insertQuery, function (err, result) {
        if (err) throw err;
        console.log("result:" + JSON.stringify(result));
        
    });

    closeDb(con)
}

function selectFromDb() {
    let con = connectToDb();

    let selectQuery = 'SELECT * FROM user';

    con.query(selectQuery, function (err, result) {
        if (err) throw err;
        console.log("result:" + JSON.stringify(result));
        
    });

    closeDb(con)
}

