const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();


//BEREKET LINGEREW
router.get('/Grade' , authentication.isStudentLoggedIn , (req , res)=> {
    res.render('student/Grade');
});

//BEREKET LINGEREW
router.get('/gradereport' , authentication.isStudentLoggedIn ,(req , res)=> {
    let sql=`select course.NAME, course.CreditHour, course.ECTS, grade.result
    from grade 
    INNER join student
    on student.StudentID=grade.StudentIDs
    INNER join course
    on course.CourseID=grade.CourseIDs
    where student.StudentID= "${req.userData.StudentID}" `;
    connection.query(sql , (error , result) => {
        if (result !==undefined && result.length > 0 ) {
     
            // console.log("Bereket")
         
                res.render('student/gradereport' , {report: result})     
        }
        else 
        {
            res.render('student/gradereport' , {report:0});
        }
     });
   
});



//BEREKET LINGEREW
router.get('/gradechange' ,  authentication.isStudentLoggedIn ,(req , res)=> {
    res.render('student/gradechange');
});

//BEREKET LINGEREW
router.post('/gradechange', authentication.isStudentLoggedIn , (req,res) => {

    let sql=`insert into gradechangerequest (InstructorGC,CourseGC,Grievance) values( (select InstructorID from
        instructor where FullName="${req.body.instructorName}"),
        (select CourseID from course where
        NAME="${req.body.courseName}"),"${req.body.grivance}")`;
    
    
    

    connection.query(sql);

});



module.exports = router;

