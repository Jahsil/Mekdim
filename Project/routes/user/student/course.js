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

//PETROS and GORGE
router.get('/registration', authentication.isStudentLoggedIn, (req , res)=> {
    let x = req.userData.StudentID;
    let sql1 = `SELECT * FROM student WHERE StudentID = "{x}"`;
    connection.query(sql1, (err, result) => {
        if (err) return console.log(err.message);
        let sql = `SELECT * FROM course WHERE semester = "{result[0].semester}"`;
        connection.query(sql, (error, result1) => {
            if (error) return console.log(error.message);
            res.render('student/registration' , {msg: result1});
        });
    });;
});

//PETROS and GORGE
router.post('/registration', authentication.isStudentLoggedIn, (req , res) => {
    let x = req.userData.StudentID;
    let sql1 = `SELECT * FROM student WHERE StudentID = "{x}"`;
    connection.query(sql1, (err, result) => {
        if (err) return console.log(err.message);

        let sql = `SELECT * FROM course WHERE semester = "{result[0].semester}"`;
        connection.query(sql, (error, result1) => {
            if (error) return console.log(error.message);
            // not implemented... couldn't do it
        });
    });;

});


module.exports = router;






