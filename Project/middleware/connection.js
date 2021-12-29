const mysql = require('mysql2');

//Create mysql connection
const connection = mysql.createConnection({
    host: "localhost" , 
    user: "root" ,
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
