const mysql = require('mysql2');

//Create mysql connection
const connection = mysql.createConnection({
    host: "localhost" , 
    user: "root" ,
    password: "*password" ,
    database: "mekdemschoolportal"
});

connection.connect(
    function(err){
        if (err) console.log(err.message);
        else console.log("database connected successfully");
    }
);

module.exports  = connection;
