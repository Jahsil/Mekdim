const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const formidable = require('formidable');
const fs = require('fs');
const router = Router();


//KALAB YIBELTAL  ATR/5464/11
let id;
// this is makeup exam request feature from the teacher side
router.get("/makeuprequestinst", authentication.isInstructorLoggedIn,(req, res) => {
    // fetching from database the list of students who applied for makeup exam to the teacher looged in
  var sql = "SELECT * FROM makeupexamrequest  WHERE InstructorRequest = '"+req.userData.FullName+"'";
      connection.query(sql, (err, result) => {
        if (result !== undefined && result.length > 0) {
          res.render("instructor/makeuprequestinst", { students: result , page: false, error: false, succes:false});
        } else {
          res.render("instructor/makeuprequestinst", { students: 0,  page: false, error: false, succes:false});
        }
      });
});

//KALAB YIBELTAL  ATR/5464/11
router.post("/makeuprequestinst", authentication.isInstructorLoggedIn, (req, res) => {
    
    id=req.body.applicants//the student which the teacher chooses based on id

      //fetching the students application form from database
    var sql = "SELECT * FROM makeupexamrequest  WHERE StudentRequest = '"+id+"'";
      connection.query(sql, (err, result) => {
        //returning the resul of the database fetach as "form" to the frontend
        if (result !== undefined && result.length > 0) {
          //console.log(result)
          res.render("instructor/makeuprequestinst", { form: result, students: 0, page: true, error: false, succes:false});
          
        } else {
          //console.log(result)
          res.render("instructor/makeuprequestinst", { form: 0,students: 0, page: false, error: false , succes:false});
        }
      });
  });        
//KALAB YIBELTAL  ATR/5464/11   
router.post("/end",authentication.isInstructorLoggedIn, (req, res) => {
  console.log(id)
  //processing the teachers verdict
  if(req.body.sub=="Approve"){
    //changing the status of the student if the teacher clicked approve
    var sql= "UPDATE makeupexamrequest SET Status = 'Approved' WHERE StudentRequest = '"+id+"'"; 
    connection.query(sql, (err, result) => {
      
      if (err) {
        console.log("error with database")
        res.render("instructor/makeuprequestinst", { form: result, students: 0, page: false, error: true, succes:false});
        
      } 
      else{
        console.log("database updated")
        res.render("instructor/makeuprequestinst", { form: result, students: 0, page: false, error: false, succes:true});
      } 
    });
  }
  //if the teacher hit disapprove no need changing the status since it is already status denied by default
  else{
    console.log("not approved")
    res.render("instructor/makeuprequestinst", { form: result, students: 0, page: false, error: false, succes:true});
  }
});

// EUAEL MEKONEN ATR/1245/11
router.get("/courseStudent", authentication.isInstructorLoggedIn, (req, res) => {
  res.render("instructor/CourseStudent", {isGet: true, msg: null});
});
router.post("/courseStudent", authentication.isInstructorLoggedIn, (req, res) => {
  let cour = req.body.ccourse;
  let sql = `SELECT * FROM course_student WHERE CourseChosen = "${cour}"`;
  connection.query(sql, (error, result) => {
    if (error) return console.log(error.message);
    res.render("instructor/CourseStudent", {isGet: false, msg: result});
  });
});


module.exports = router;

