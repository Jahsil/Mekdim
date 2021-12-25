const mysql = require('mysql2');

//Create mysql connection
const connection = mysql.createConnection({
    host: "localhost" , 
    user: "geek" ,
    password: "1560" ,
    database: "mekdemschoolportal"
});

connection.connect(
    function(err){
        if (err) console.log(err.message);
        else console.log("database connected successfully");
    }
);

module.exports  = connection;
