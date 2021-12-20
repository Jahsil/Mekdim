const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');


const router = Router();

//FIKREMARYAM MOLLA  ATR/5389/10
router.get('/admin/club/approval' , authentication.isAdminLoggedIn  , (req , res) => {
    let sql = ` select * from clubs where status = "Not approved" `;
    connection.query(sql , (error , result)=>{  
         res.render('club/clubapproval' , { club : result}); 
    }); 
});

//FIKREMARYAM MOLLA  ATR/5389/10
router.get('/admin/club/approval/:ClubName' , authentication.isAdminLoggedIn  , (req , res) => {
    let sql =  ` UPDATE clubs SET status="approved" WHERE ClubName = "${req.params.ClubName}" `;
    connection.query(sql , (error , result) => {  
        res.redirect('/admin/club/approval');
    });
    
});


//NATNAEL MINWUYELET ATR/4004/11
router.get('/approval/lostid' ,  authentication.isAdminLoggedIn , (req , res) => {
    let sql = ` select * from lostid where status = "Not approved" `;
    connection.query(sql , (error , result)=>{  
         res.render('lostid' , { result : result}); 
    }); 
});

//NATNAEL MINWUYELET ATR/4004/11
router.get('/approval/lostid/:name'  , authentication.isAdminLoggedIn ,(req , res) => {
    let sql = `UPDATE lostid SET status="approved" WHERE name = "${req.params.name}" `;
    connection.query(sql , (error , result) => {  
        res.redirect('/approval/lostid');
    });
    
});


module.exports = router;




