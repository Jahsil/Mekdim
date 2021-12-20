const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();


//BEREKET LINGEREW
router.get('/Grade' , authentication.isStudentLoggedIn , (req , res)=> {
    res.render('Grade');
});

//BEREKET LINGEREW
router.get('/gradereport' , authentication.isStudentLoggedIn ,(req , res)=> {
    let sql=`select course.NAME, course.CreditHour, course.ECTS, grade.result
    from grade 
    INNER join student
    on student.StudentID=grade.StudentIDs
    INNER join course
    on course.CourseID=grade.CourseIDs
    where student.StudentID= "${nameo}" `;
    connection.query(sql , (error , result) => {
        if (result !==undefined && result.length > 0 ) {
     
            // console.log("Bereket")
         
                res.render('gradereport' , {report: result})     
        }
        else 
        {
            res.render('gradereport' , {report:0});
        }
     });
   
});

//BEREKET LINGEREW
router.get('/GradeReportApproval' , authentication.isStudentLoggedIn ,(req , res)=> {

    console.log(req.userData);
    res.render('GradeReportApproval' , { student: req.userData });
});
//BEREKET LINGEREW
router.post('/GradeReportApproval' , authentication.isStudentLoggedIn, (req , res) => { 
let sql=`select student.FullName, grade.result, grade.ApprovalStatus
from grade 
INNER join student
on student.StudentID=grade.StudentIDs
INNER join course
on course.CourseID=grade.CourseIDs
where course.name= "${req.body.CourseName}" `;
     connection.query(sql , (error , result) => {
        if (result) {
     
                
                res.render('GradeReportApproval' , {student0: result[0].FullName, rslt0: result[0].result,
                    approve0: result[0].ApprovalStatus,
                    student1: result[1].FullName, rslt1: result[1].result,
                    approve1: result[1].ApprovalStatus})
           
        } 
        else {
            console.log("Another");
        }
        
     });

    });




//BEREKET LINGEREW
router.get('/gradechange' ,  authentication.isStudentLoggedIn ,(req , res)=> {
    res.render('gradechange');
});

//BEREKET LINGEREW
router.post('/gradechange', authentication.isStudentLoggedIn , (req,res) => {

    let sql=`insert into gradechangerequest (InstructorGC,CourseGC,Grievance) values("${req.body.instructorName}","${req.body.courseName}","${req.body.grivance}")`;

    connection.query(sql);

});



module.exports = router;

