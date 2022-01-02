const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();

//NIGUS
router.get('/CourseChecklist', authentication.isStudentLoggedIn ,(req , res)=> {
    const sql=`select course.ModuleName,course.NAME,course.ECTS, student.StudentID, student.FullName, student.RegistrationYear, student.CurrentYear from course
    join course_student
    on course.CourseID= course_student.CourseChosen
    join student
    on student.StudentID=course_student.StudentInCourse
    where student.StudentID="atr/1111/11"`;

    
    connection.query(sql , (error , result) => {
        if (result !==undefined && result.length > 0 ) {
            console.log(result);
                res.render('student/CourseChecklist' , {moddelname1: result[0].ModuleName,name1:result [0].NAME,
                    ects1: result[0].ECTS,
                    moddelname2: result[1].ModuleName,name2:result [1].NAME,
                    ects2: result[1].ECTS,moddelname3: result[2].ModuleName,name3:result [2].NAME,
                    ects3: result[2].ECTS,moddelname4: result[3].ModuleName,name4:result [3].NAME,
                    ects4: result[3].ECTS,
                    sID: result[0].StudentID,
                    fName: result[0].FullName,
                    year: Number(result[0].CurrentYear)-Number(result[0].RegistrationYear)+1

                })      
             }
        else 
        { 
            console.log("result err")
            res.render('student/CourseChecklist' , {CourseChecklist:0});
        }
     });

});



//KALAB YIBELTAL  ATR/5464/11
router.get("/adddrop", authentication.isStudentLoggedIn,(req, res) => {
    var sql = "SELECT * FROM course";
      //fetching the available courses from database and sending to the front end
      connection.query(sql, (err, result) => {
        if (result !== undefined && result.length > 0) {
          res.render("student/adddrop", { courses: result , page: true});
        } else {
          res.render("student/adddrop", { courses: 0,  page: true});
        }
      });
    });
  router.post("/adddrop", authentication.isStudentLoggedIn,(req, res)=>{
    if(req.body.sub=="ADD"){
      //Adding the course to the student while the approval is pending from admin
      var sql='INSERT into student_course_registration VALUES (NULL,"'+req.userData.StudentID+'", "'+req.body.course+'" ,"pending")';
      connection.query(sql, (err, result) => {
        if (result !== undefined && result.length > 0) {
          res.render("student/adddrop", { courses: result , page: false});
          console.log("added");
        } else {
          res.render("student/adddrop", { courses: 0,  page: false});
        }
      });
    }
    else if(req.body.sub=="DROP"){
      //deleting the student from a course
      var sql="delete from student_course_registration where studentid ='"+req.userData.StudentID+"' and courseid='"+req.body.course+"'";
      connection.query(sql, (err, result) => {
        if (result !== undefined && result.length > 0) {
          console.log("drroped");
          res.render("student/adddrop", { courses: result , page: false, error: false});
        } else {
          res.render("student/adddrop", { courses: 0,  page: false, error: false});
        }
      });
    }
  })

//PETROS and GORGE
router.get('/registration', authentication.isStudentLoggedIn, (req , res)=> {
    let x = req.userData.StudentID;
    let sql1 = `SELECT * FROM student_semister WHERE student_id = "{x}"`;
    connection.query(sql1, (err, result) => {
        if (err) return console.log(err.message);
        let sql = `SELECT * FROM course_semister WHERE semister = "{result[0].semister}"`;
        connection.query(sql, (error, result1) => {
            if (error) return console.log(error.message);
            let sql = `SELECT * FROM course WHERE CourseID = "{result1[0].course_id}"`;
            connection.query(sql, (error, result2) => {
                if (error) return console.log(error.message);
                res.render('student/registration' , {msg: result2});
            });
        });
    });;
});

//PETROS and GORGE
router.post('/registration', authentication.isStudentLoggedIn, (req , res) => {
    let x = req.userData.StudentID;
    let sql1 = `INSERT INTO course_student (StudentInCourse, CourseChosen, CourseGrade) VALUES ("{req.userData.StudentID}", "{req.body.course}", "F")`;
    connection.query(sql1, (err, result) => {
        if (err) return console.log(err.message);
    });;

});


module.exports = router;






