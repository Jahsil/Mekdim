const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();



// Lillian alehegn    ATR/4546/11
//clearance 
router
.get('/clearance',authentication.isStudentLoggedIn,(req,res)=>{
    res.render('student/clearance.ejs',{error: false});
  //let sql = `select * from student where studentId = ${req.userData.StudentID} `;
   
});

router
.post('/clearance',authentication.isStudentLoggedIn,(req,res)=> {
   let fname = req.body.fname;
   let mname = req.body.mname;
   let lname = req.body.lname;
   let date  = req.body.date;
    let id = req.body.id;
    let sex= req.body.sex;
    let cyear= req.body.cyear;
   let rfc= req.body.rfc;
   let myfile= req.body.myfile;
   let sql = `INSERT INTO clearance VALUES ('${fname}', '${mname}', '${lname}', '${date}', '${id}', '${sex}', '${cyear}', '${rfc}', '${myfile}')`;
   connection.query(sql , (error , result) => {
       if(!error){
           console.log(result);
           res.render('student/clearance.ejs',{msg: false});
       }
       else{
           console.log(error.message);
           res.render('student/clearance.ejs' ,{msg: true});
       }
       //  res.redirect("/home");
   });
});

// transferRequest

router
.get('/intraTransferReq',authentication.isStudentLoggedIn,(req,res)=>{
    res.render('student/intraTransferReq.ejs',{error: false});
  let sql = `select * from student where studentId = ${req.userData.StudentID}`;
});
router
.post('/intraTransferReq',authentication.isStudentLoggedIn,(req,res)=>{
    let fname = req.body.fname;
    let mname = req.body.mname;
    let lname = req.body.lname;
    let id    = req.userData.StudentID;
    let date  = req.body.date;
    let sex   = req.body.sex;
    let egy   = req.body.egy;
    let cgpa  = req.body.cgpa;
    let depto = req.body.depto;
    let deptfrom = req.body.deptfrom;
    let sql = `INSERT INTO transferrequest VALUES ('${id}', '${fname}', '${mname}', '${lname}', '${date}', '${sex}', '${egy}', '${cgpa}', '${depto}' , '${deptfrom}')`;
   connection.query(sql , (error , result) => {
       if(!error){
           console.log(result);
           res.render('student/intraTransferReq.ejs',{msg: false});
       }
       else{
           console.log(error.message);
           res.render('student/intraTransferReq.ejs' ,{msg: true});
       }
//    res.redirect("/home");
});
});


// Michael Eshete   Atr/5574/11

//lostid
router
.get('/lostid', authentication.isStudentLoggedIn , (req , res)=> {
    res.render('student/lost_id_request.ejs' , {msg: false });  //This line is used to load the lost id page
});

router
.post('/lostid', authentication.isStudentLoggedIn, (req , res) => { 
    let sql = `INSERT INTO lostid VALUES ('${req.userData.StudentID}', '${req.body.name}', '${req.body.year}', '${req.body.dep}', '${req.body.date}','NOT APPROVED')`; //used to store the entered values into the database
    connection.query(sql , (err , result) => {
     if (!err ) {
         console.log(result);
           res.render('student/lost_id_request',{msg:false}); //used if the user entered the values correctly
     } else {
         console.log(err.message);
         res.render('student/lost_id_request' , {msg:true }); //used if the user doesn't enter the values correctly
      }
  });
});
//withdrawal

router
.get('/withdrawal', authentication.isStudentLoggedIn , (req , res)=> {
    res.render('student/withdrawal_request.ejs' , {msg: false });        // This line is used to bring the withdrawal page
});

router
.post('/withdrawal', authentication.isStudentLoggedIn, (req , res) => { 
    let sql = `INSERT INTO withdrawalrequest VALUES ('${req.userData.StudentID}', '${req.body.name}', '${req.body.sex}','${req.body.dep}','${req.body.rfw} ')`;// This line is used to save the entered values into the repository(database)
    connection.query(sql , (err , result) => {
     if (!err ) {
         console.log(result); 
           res.render('student/withdrawal_request.ejs',{msg:false}); // This condition is used if the withdrawal is successful
     } else {
         console.log(err.message);
         res.render('student/withdrawal_request.ejs' , {msg:true }); //This is used if the student entered invalid values
      }
  });
});




//MARKOS BEYENE ATR/1689/11
router.get('/financial' , authentication.isStudentLoggedIn ,(req , res)=> {
     res.render('student/financialAid' , {msg:0});        
});

//MARKOS BEYENE ATR/1689/11
router.post('/financial', authentication.isStudentLoggedIn , (req , res) => { 
    let sql = `INSERT INTO financialaid (StudentFinanced  , Reason , Status ) VALUES ('${req.userData.StudentID}', '${req.body.reason}', 'Not approved') `;
   
    connection.query(sql , (err , result) => {
     if (err) {
           console.log(err);
           res.render('student/financialAid',  {msg:1}); 
     } else {
         res.render('student/financialAid' , {msg:2 }); 
      }
  });
});







module.exports = router;
