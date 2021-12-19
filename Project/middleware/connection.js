const mysql = require('mysql2');

//Create mysql connection
const connection = mysql.createConnection({
    host: "localhost" , 
    user: "root" , 
    password: "joel123" , 
    database: "mekdemschoolportal"
});

connection.connect(
    function(err){
        if (err) console.log(err);
        else  
        {
            //app.listen(3000 , ()=>console.log("server running on port 3000"));
            console.log("database connected successfully");
        }
    }
);

module.exports  = connection;
