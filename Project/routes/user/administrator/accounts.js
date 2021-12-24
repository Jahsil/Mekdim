const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');


const router = Router();

//KALAB YIBELTAL  ATR/5464/11
router.get("/adduser",  authentication.isAdminLoggedIn   , (req, res) => {
    res.render("administrator/adduser", { error: false, error2: false});
});

//KALAB YIBELTAL  ATR/5464/11
router.post("/adduser",authentication.isAdminLoggedIn,(req, res) => {
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
    res.render("administrator/adduser", { error: true, error2: true });
  }
  // checking wether the admin is registering student(1), instructor(2), or administrator(3)
 if(userRole==1){

    connection.query('insert into student values ("'+idNumber+'" , "'+name+'" ,"male",  "11/11/11", "'+password+'" , "1212@gmail.com" ,"09111111","'+department+'", 2011, 2011, "valid" , 4)', (error , result) =>{
      console.log(error);
      //returning error if the admin filled wrong form or same name twice
      res.render("administrator/adduser", { error: false, error2: true });
    });
  }
  else if(userRole==2){
    connection.query('insert into instructor values ("'+idNumber+'" , "'+name+'" ,"male", "'+password+'" , "1212@gmail.com" ,"09111111","E-111", "ElecEng", "'+degree+'" )' , (error , result) =>{
      console.log(error);
       //returning error if the admin filled wrong form or same name twice
       res.render("administrator/adduser", { error: false, error2: true });
      
    });
  }
  else if(userRole==3){
    connection.query('insert into administrator values ("'+idNumber+'" , "'+name+'" ,"male",  "'+password+'" , "1212@gmail.com" ,"09111111", "'+responsibility+'" )', (error , result) =>{
      console.log(error);
       //returning error if the admin filled wrong form or same name twice
       res.render("administrator/adduser", { error: false, error2: true });
     
    })
  }
  //filling in place holder values, so that the added user fill them in later when setting up their profile
});


//MARKOS
router.get('/admin/account/' , authentication.isAdminLoggedIn   ,(req , res)=> {
  res.render('administrator/AccountActivation' , { result:0}  );
});
//MARKOS
router.post('/admin/account/' , authentication.isAdminLoggedIn  , (req , res) => { 
  if (req.body.occupation == "Student") 
     {
      let sql = `select * from student where studentId = "${req.body.id}" `;
      connection.query(sql , (error , result) => {
       if (result !==undefined && result.length > 0 ) {
          res.render('administrator/AccountActivation' , { result: result   } );
         } 
       });
     }
});

router.get('/admin/account/activate/:StudentId' , authentication.isAdminLoggedIn  , (req , res) => {
  let sql =  ` UPDATE student SET IDStatus = "active" WHERE FullName = "${req.params.StudentId}" `;
  connection.query(sql , (error , result) => {  
      res.redirect('/admin/account/');
  });
});

router.get('/admin/account/deactivate/:StudentId'  , authentication.isAdminLoggedIn  , (req , res) => {
  let sql =  ` UPDATE student SET IDStatus = "deactive" WHERE FullName = "${req.params.StudentId}" `;
  connection.query(sql , (error , result) => {  
      res.redirect('/admin/account/');
  });
  
});


module.exports = router;



