const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');


const router = Router();

//FIKREMARYAM MOLLA  ATR/5389/10
router.get('/admin/club/approval' , authentication.isAdminLoggedIn  , (req , res) => {
    let sql = ` select * from clubs where status = "Not approved" `;
    connection.query(sql , (error , result)=>{  
         res.render('administrator/clubapproval' , { club : result}); 
    }); 
});

//FIKREMARYAM MOLLA  ATR/5389/10
router.get('/admin/club/approval/:ClubName' , authentication.isAdminLoggedIn  , (req , res) => {
    let sql =  ` UPDATE clubs SET status="approved" WHERE ClubName = "${req.params.ClubName}" `;
    connection.query(sql , (error , result) => {  
        res.redirect('/admin/club/approval');
    });
    
});


//Nigus Getif  ATR/9975/11
router.get('/admin/dorm/approval' , authentication.isAdminLoggedIn  , (req , res) => {
    let sql = ` select * from dormitory where RequestStatus = "pending" `;
    connection.query(sql , (error , result)=>{  
         res.render('administrator/dormapproval' , { dorm : result}); 
    }); 
});

//Nigus Getif  ATR/9975/11
router.get('/admin/dorm/approval/:dormId' , authentication.isAdminLoggedIn  , (req , res) => {
    let sql =  ` UPDATE dormitory SET RequestStatus ="approved" WHERE ID = "${req.params.dormId}" `;
    connection.query(sql , (error , result) => {  
        res.redirect('/admin/dorm/approval');
    });
});


//NATNAEL MINWUYELET ATR/4004/11
router.get('/approval/lostid' ,  authentication.isAdminLoggedIn , (req , res) => {
    let sql = ` select * from lostid where status = "Not approved" `;
    connection.query(sql , (error , result)=>{  
         res.render('administrator/lostid' , { result : result}); 
    }); 
});

//NATNAEL MINWUYELET ATR/4004/11
router.get('/approval/lostid/:name'  , authentication.isAdminLoggedIn ,(req , res) => {
    let sql = `UPDATE lostid SET status="approved" WHERE name = "${req.params.name}" `;
    connection.query(sql , (error , result) => {  
        res.redirect('/approval/lostid');
    });
    
});

//BEREKET LINGEREW
router.get('/GradeReportApproval' , authentication.isAdminLoggedIn , (req , res)=> {

    res.render('administrator/GradeReportApproval' , { student: req.userData });
});
//BEREKET LINGEREW
router.post('/GradeReportApproval' , authentication.isAdminLoggedIn , (req , res) => { 
let sql=`select student.FullName, grade.result, grade.ApprovalStatus
from grade 
INNER join student
on student.StudentID=grade.StudentIDs
INNER join course
on course.CourseID=grade.CourseIDs
where course.name= "${req.body.CourseName}" `;
     connection.query(sql , (error , result) => {
        if (result) {
     
                
                res.render('administrator/GradeReportApproval' , {student0: result[0].FullName, rslt0: result[0].result,
                    approve0: result[0].ApprovalStatus,
                    student1: result[1].FullName, rslt1: result[1].result,
                    approve1: result[1].ApprovalStatus})
           
        } 
        else {
            console.log("Another");
        }
        
     });

    });

router.get('/admin/event/approval'  ,  authentication.isAdminLoggedIn   , (req , res) => {
    let sql = ` select * from events where status = "Not approved" `;
    connection.query(sql , (error , result)=>{  
         res.render('administrator/Event_approval' , { event : result}); 
    }); 
});

router.get('/admin/event/approval/:EventName' , authentication.isAdminLoggedIn  , (req , res) => {
    let sql =  `UPDATE events SET status="approved" WHERE EventName = "${req.params.EventName }" `;
    connection.query(sql , (error , result) => {  
        res.redirect('/admin/event/approval');
    });
});



//MARKOS BEYENE  ATR/1689/11
router.get('/admin/financial/approval'  , authentication.isAdminLoggedIn , (req , res) => {
    let sql = ` select * from financialaid where Status = "Not approved" `;
    connection.query(sql , (error , result)=>{  
         res.render('administrator/financialapproval' , { finance : result}); 
    }); 
});

//MARKOS BEYENE  ATR/1689/11
router.get('/admin/financial/approval/:id' , authentication.isAdminLoggedIn  , (req , res) => {
    let sql =  ` UPDATE financialaid SET Status ="approved" WHERE ID = "${req.params.id}" `;
    connection.query(sql , (error , result) => {  
        res.redirect('/admin/financial/approval');
    });
});



module.exports = router;




