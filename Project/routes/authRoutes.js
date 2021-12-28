const { Router } = require('express');
const connection = require('../middleware/connection');
const jwt = require('jsonwebtoken');

const router = Router();

//login page for student - get request
router.get('/login' , (req , res)=> {
    res.render('login/login' , {error: false });
});


//login page for student - post request
router.post('/login' , (req , res) => { 
     let sql = `select * from student where studentId = "${req.body.username}" and password = "${req.body.password}"  `;
     connection.query(sql , (error , result) => {
      if (result !==undefined && result.length > 0 ) {
          const token = jwt.sign({
              StudentID : result[0].StudentID , 
              FullName: result[0].FullName
            },
            'SECRETKEY', {
              expiresIn: '7d'
            });
            
            res.cookie('jwt' , token , {httpOnly:true , maxAge:3600*1000});
            res.redirect('/home')
    
      } else {
          res.render('login/login' , {error:true });
       }
   });
});

//login page for instructor - get request
router.get('/login/instructor' , (req , res)=> {
    res.render('login/login_instructor' , {error: false });
});


//login page for instructor - post request
router.post('/login/instructor' , (req , res) => { 
     let sql = `select * from instructor where InstructorId = "${req.body.username}" and Password = "${req.body.password}"  `;
     connection.query(sql , (error , result) => {
      if (result !==undefined && result.length > 0 ) {
          const token = jwt.sign({
              InstructorID : result[0].InstructorID , 
              FullName: result[0].FullName
            },
            'SECRET', {
              expiresIn: '7d'
            });
            
            res.cookie('jwt' , token , {httpOnly:true , maxAge:3600*1000});
            res.redirect('/instructor/home');
    
      } else {
          res.render('login/login_instructor' , {error:true });
       }
   });
});


//login page for admin - get request
router.get('/login/admin' , (req , res)=> {
    res.render('login/login_admin' , {error: false });
});



//login page for admin - post request
router.post('/login/admin' , (req , res) => { 
    let sql = `select * from administrator where AdministratorID = "${req.body.username}" and Password = "${req.body.password}"  `;
    connection.query(sql , (error , result) => {
     if (result !==undefined && result.length > 0 ) {
         const token = jwt.sign({
             AdministratorID : result[0].AdministratorID , 
             FullName: result[0].FullName
           },
           'SECRETADMIN', {
             expiresIn: '7d'
           });
           
           res.cookie('jwt' , token , {httpOnly:true , maxAge:3600*1000});
           res.redirect('/admin/home'); 
     } else {
         res.render('login/login_admin' , {error:true });
      }
  });
});


router.get('/logout' , (req , res)=> {
  res.cookie('jwt' , '' , {maxAge:1});
  res.redirect('/login')
});


module.exports = router;





