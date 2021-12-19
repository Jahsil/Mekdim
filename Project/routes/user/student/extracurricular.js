const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();


router.get('/council' , authentication.isStudentLoggedIn ,(req , res)=> {
    //req.userData.StudentID   holds the current logged in student id which is a string
    //req.userData.FullName    holds the current logged in student full name
    let sql =  `select * from council`;
    connection.query(sql , (error , result) => {
        if (result !==undefined && result.length > 0 ) {
        res.render('council' , {council: result})
        }
        else 
        {
            res.render('council' , {council:0});
        }
     });
});


router.get('/club/information' , authentication.isStudentLoggedIn ,(req , res)=> {
    //req.userData.StudentID   holds the current logged in student id which is a string
    //req.userData.FullName    holds the current logged in student full name
    let sql =  `select * from clubs where Status="Approved" `;
    connection.query(sql , (error , result) => {
        if (result !==undefined && result.length > 0 ) {
        res.render('club' , {club: result})
        }
        else 
        {
            res.render('club' , {club:0});
        }
     });
});


//Club event page for student - get request
router.get('/club/events' , authentication.isStudentLoggedIn ,(req , res)=> {
    //req.userData.StudentID   holds the current logged in student id which is a string
    //req.userData.FullName    holds the current logged in student full name
    let sql =  `select * from events where Status="Approved" `;
    connection.query(sql , (error , result) => {
        if (result !==undefined && result.length > 0 ) {
        res.render('event' , {event: result})
        }
        else 
        {
            res.render('event' , {event:0});
        }
     });
});

router.get('/club/createClub' , authentication.isStudentLoggedIn ,(req , res)=> {
    //req.userData.StudentID   holds the current logged in student id which is a string
    //req.userData.FullName    holds the current logged in student full name
     
});



module.exports = router;





