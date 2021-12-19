const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();

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


//Staff Evaluation page for student - post request
router.post('/evaluation' ,authentication.isStudentLoggedIn ,(req , res)=> {
    //req.userData.StudentID   holds the current logged in student id which is a string
    //req.userData.FullName    holds the current logged in student full name
    
    let sql = `select * from staffevaluation where StudentID = "${req.userData.StudentID}" and InstructorID = "${req.body.instructor}" `;
    connection.query(sql , (error , result) => {   
        if(result == undefined)
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


router.get('/contactInstructor'  , ( req , res)=> {
    res.render('student/contactInstructor' , {address:0});
});




//contact instructor for student - post request
router.post('/contactInstructor' , (req , res) => { 
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




module.exports = router;





