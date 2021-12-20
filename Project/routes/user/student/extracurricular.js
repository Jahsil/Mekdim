const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();

//MILKIYAS G/MICHAEL - ATR/1277/11    
router.get('/council' , authentication.isStudentLoggedIn ,(req , res)=> {
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

//FIKREMARYAM MOLLA  ATR/5389/10
router.get('/club/information' , authentication.isStudentLoggedIn ,(req , res)=> {
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

//FIKREMARYAM MOLLA  ATR/5389/10
router.get('/club/events' , authentication.isStudentLoggedIn ,(req , res)=> {
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


//FIKREMARYAM MOLLA  ATR/5389/10
router.get('/club/clubcreate' , authentication.isStudentLoggedIn  ,(req , res)=> {
    res.render( 'clubcreate' , {message:0 });
});

//FIKREMARYAM MOLLA  ATR/5389/10
router.post('/club/clubcreate' ,  authentication.isStudentLoggedIn ,(req , res)=> {
    let todayDate = new Date().toISOString().slice(0, 10);
    let sql =  `insert into clubs values ( "${req.body.name}" , "Not approved" ,  "${todayDate}", "${req.body.email}" , "${req.body.goal}"  , "${req.body.vision}", "${req.body.mission}" )`;
    connection.query(sql , (error , result) => {
        if (error ==null ) {
         res.render('clubcreate' , {message:1});
        }
        else 
        {
         res.render('clubcreate' , {message:2});
        }
     });
});




module.exports = router;





