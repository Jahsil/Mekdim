const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');
const fetch= require('node-fetch');
const formidable = require('formidable');
const fs = require('fs');
const path = '../../../public/';


const router = Router();


//NATNAEL MINWUYELET ATR/4004/11
let global;
router.get('/evaluation' , authentication.isStudentLoggedIn , (req , res)=> {
    //req.userData.StudentID   holds the current logged in student id which is a string
    //req.userData.FullName    holds the current logged in student full name
    let sql =  `select * from instructor`;
    connection.query(sql , (error , result) => {
        global = result;
        if (result !==undefined && result.length > 0 ) {
        res.render('student/staff' , {instructor: result , message:0})
        }
        else 
        {
            res.render('student/staff' , {instructor : 0 , message:0});
        }
     });
});


//NATNAEL MINWUYELET ATR/4004/11
router.post('/evaluation' ,authentication.isStudentLoggedIn ,(req , res)=> {   
    let sql = `select * from staffevaluation where StudentID = "${req.userData.StudentID}" and InstructorID = "${req.body.instructor}" `;
    connection.query(sql , (error , result) => {   
        if(result === undefined)
        {
            res.render('student/staff' , {instructor : global , message: 1});
        }
        else
        {
            let sql =  `insert into staffevaluation values ( "${req.body.clarification}", "${req.body.knowledge}" , "${req.body.funny}" ,"${req.body.feedback}" , "${req.body.fair}" , "${req.body.respect}", "${req.body.time}", "${req.userData.StudentID}" , "${req.body.instructor}" )`;
            connection.query(sql , (error , result) => {   
                 if(result)
                   {
                    res.render('student/staff' , {instructor : global , message: 2});
                 }
             });
        }
    });
});

//NATNAEL MINWUYELET ATR/4004/11
router.get('/contactInstructor' ,authentication.isStudentLoggedIn , ( req , res)=> {
    res.render('student/contactInstructor' , {address:0});
});

//NATNAEL MINWUYELET ATR/4004/11
router.post('/contactInstructor' , authentication.isStudentLoggedIn , (req , res) => { 
    let sql = `select * from instructor where FullName = "${req.body.Search}"   `;
    connection.query(sql , (error , result) => {
     if (result !==undefined && result.length > 0 ) {
         let address = {
             OfficeNo: result[0].OfficeNo ,
             Email:result[0].Email,
             department:result[0].InstructorDepartment
         }
         res.render('student/contactInstructor' , {address:address });
   
     } else {
         res.render('student/contactInstructor' , {address: 1 });
      }
  });
});


//KALAB YIBELTAL  ATR/5464/11
let contentr;
let authorr;
router.get("/contactdephead",authentication.isStudentLoggedIn, (req, res) => {
    //adding 'quote of the day' to attract the user
    fetch("https://api.quotable.io/random")
    .then((data) => data.json())
    .then((item) => {
      contentr = item.content;
      authorr = item.author;
      res.render("student/contactdephead", { content: contentr, author:authorr, page:true, error: false});
    });
    
    });

//KALAB YIBELTAL  ATR/5464/11
router.post("/contactdephead",authentication.isStudentLoggedIn, (req, res) => {
    //inserting into contactdephead tablestudent name(from userData.FullName)and
    //  ( department, subject and body) from the form
      connection.query('insert into contactdephead values (NULL,"'+req.userData.FullName+'" , "'+req.body.department+'" ,"'+req.body.subject+'", "'+req.body.bodyy+'")', (error , result) =>{
        res.render("student/contactdephead", {  content: contentr, author:authorr,page:true,error: false}); 
      })
    /* we can send the students note directly to the department head email
        however nor email or yahoo allow such acces to their platform but 
        if the school have its own mail system we can override the oAuth authentication 
        and send emails dierectly using the code below
    */
    //   var nodemailer = require('nodemailer');
    //   var transporter = nodemailer.createTransport({
    //     service: 'gmail',
    //     auth: {
    //       user: 'kalabalpha@yahoo.com',
    //       pass: 'yourpassword'
    //     }
    //   });
      
    //   var mailOptions = {
    //     from: 'kalabaplha@yahoo.com',
    //     to: 'euaelmeko@yahoo.com',
    //     subject: req.body.subject,
    //     text: req.body.bodyy
    //   };
      
    //   transporter.sendMail(mailOptions, function(error, info){
    //     if (error) {
    //       console.log(error);
    //     } else {
    //       console.log('Email sent: ' + info.response);
    //     }
    //   });
  });

  //KALAB YIBELTAL  ATR/5464/11
  router.get('/makeuprequest' ,authentication.isStudentLoggedIn,(req , res)=> {
    //selecting the courses the student takes and sending them to the frontend when
    //the student enters the makeuprequest page
    
    var sql = "SELECT * FROM course_student  WHERE StudentInCourse = '"+req.userData.StudentID+"'";
    // incase "req.userData.StudentID" is not working insert "Atr/1111/11"
    //inplace of id
    connection.query(sql, (err, result) => {
      if (result !== undefined && result.length > 0) {
        // the courses the student take are sent as "courses" array
        res.render("student/makeuprequest", { courses: result, error: false });
      } else {
        res.render("student/makeuprequest", { courses: 0 , error: false});
      }
    });
   
});

//KALAB YIBELTAL  ATR/5464/11
router.post('/makeuprequest',authentication.isStudentLoggedIn,(req,res)=>{
    const id = req.userData.StudentID;
    const idtrial = "Atr/1111/11"; // incase "req.userData.StudentID" is not working insert "Atr/1111/11"
   //inplace of id

    let form = new formidable.IncomingForm();
    //parsing and storing the received file new address
    form.parse(req, function (err, fields, files) {
        if(err){
            return console.log(err.message);
        }
        console.log(files.filen.filepath);
        let oldpath = files.filen.filepath;
        let newpath = '../../..Files/MakeupExamRequest/' + files.filen.originalFilename;
        fs.rename(oldpath, newpath, function (err) {
          if (err) return console.log(err.message);
          console.log('File uploaded!');
          res.render('student/makeuprequest',{courses: 0, error: false })
        });
        console.log(fields);//field is the equivalent of req in fs file parser
       var sql='insert into makeupexamrequest values (NULL , "'+id+'" ,"'+fields.course+'", "'+fields.instname+'", "'+fields.reason+'" ,"'+newpath+'" ,"'+fields.date+'","denied")'
       connection.query(sql, (error , result) =>{
        if(error){
            console.log(error)
            //if error happend reloading the page and printing in the front end to fill the form again
            res.render("student/makeuprequest", { error: true});   
        }
      });
        
    });

});



//MILKIYAS G/MICHAEL - ATR/1277/11
router.get('/projectandassigmnet' , authentication.isStudentLoggedIn, (req , res)=> {
  let sql = `SELECT * FROM course_student WHERE StudentInCourse = "${req.userData.StudentID}"`;
  let temp = [];
  connection.query(sql, (error, result) => {
      if(error) return console.log(error.message);
      for(let i = 0; i < result.length; i++){
          let sql1 = `SELECT * FROM assignments WHERE Course = "${result[i].CourseChosen}"`;
          connection.query(sql1, (err, res1) => {
              if(res1.length === 0){
                  return;
              } 

              temp.push({
                  courseName: res1[0].Course,
                  path: res1[0].AssignmentPath
              });

              if (i === result.length - 1){
                  // console.log("sending assignments ...");
                  // console.log(temp);
                  if(temp.length === 0){
                      res.render("student/projectandassigmnet", {msg: null});
                      return;
                  }
                  // console.log(temp);
                  res.render('student/projectandassigmnet', {msg: temp});
              }

          });
      }
  });
});

//MILKIYAS G/MICHAEL - ATR/1277/11
router.get("/projandassSubmition", authentication.isStudentLoggedIn, (req, res) => {
  let sql = `SELECT * FROM course_student WHERE StudentInCourse = "${req.userData.StudentID}"`;
  let temp = [];
  connection.query(sql, (error, result) => {
      if(error) return console.log(error.message);
      for(let i = 0; i < result.length; i++){
          let sql1 = `SELECT * FROM assignments WHERE Course = "${result[i].CourseChosen}"`;
          connection.query(sql1, (err, res1) => {
              if(res1.length === 0){
                  return;
              } 

              temp.push({
                  courseName: res1[0].Course,
                  path: res1[0].AssignmentPath
              });

              if (i === result.length - 1){
                  if(temp.length === 0){
                      res.render("student/submitpage", {msg: null});
                      return;
                  }
                  res.render('student/submitpage', {msg: temp});
              }

          });
      }
  });
});

//MILKIYAS G/MICHAEL - ATR/1277/11
router.post("/projandassSubmition", authentication.isStudentLoggedIn, (req, res) => {
  var form = new formidable.IncomingForm();
  form.parse(req, function (err, fields, files) {
      if(err) return console.log(err.message);
     
      var oldpath = files.assFile.filepath;
      var newpath = `../../../Files/AssignmentsSubmitted/${files.assFile.originalFilename}`;
      console.log(newpath);
      fs.rename(oldpath, newpath, function (err) {
        if (err) return console.log(err.message);
        console.log("File uploaded and moved!");
        res.redirect("/projectandassigmnet");
      });
      let sql = `INSERT into assignmentsubmission (Student, Assignment, course) VALUES ("${req.userData.StudentID}", "${newpath}", "${fields.courses}")`;
      connection.query(sql, (error, result) => {
          if(error) return console.log(error.message);
      });
  });
});


module.exports = router;





