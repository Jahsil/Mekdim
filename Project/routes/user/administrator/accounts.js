const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');


const router = Router();

//add user
router.get('/admin/adduser' , authentication.isAdminLoggedIn , (req, res) => {
    res.render('adduser', { error: false});
});

router.post('/admin/adduser' , authentication.isAdminLoggedIn , (req, res) => {
// assigning the add user from inputs from front end to variables 
 var name = req.body.username;
 var idNumber = req.body.id;
 var password = req.body.password;
 var confirmpassword = req.body.confirmpassword;
 var department = req.body.deps;
 var degree = req.body.degree;
 var responsibility = req.body.responsibility;
 var userRole = req.body.occupation;
 
 //making sure the user(adminsitrator) enterd the same password and confirm password
 if(password!== confirmpassword){
   res.render("adduser", { error: true });
 }
 // checking wether the admin is registering student(1), instructor(2), or administrator(3)
if(userRole==1){

   connection.query('insert into student values ("'+idNumber+'" , "'+name+'" ,"male",  "11/11/11", "'+password+'" , "1212@gmail.com" ,"09111111","'+department+'", 2011, 2011, "valid" , 4)')
 }
 else if(userRole==2){
   connection.query('insert into instructor values ("'+idNumber+'" , "'+name+'" ,"male", "'+password+'" , "1212@gmail.com" ,"09111111","E-111", "ElecEng", "'+degree+'" )' , (error , result) =>{
   console.log(error);
   });
 }
 else if(userRole==3){
   connection.query('insert into administrator values ("'+idNumber+'" , "'+name+'" ,"male",  "'+password+'" , "1212@gmail.com" ,"09111111", "'+responsibility+'" )')
 }
 //filling in place holder values, so that the added user fill them in later when setting up their profile
});

module.exports = router;
