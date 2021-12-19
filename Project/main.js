const cookieParser = require('cookie-parser'); 
const express = require('express');

const authentication = require('./middleware/authentication.js');
const connection = require('./middleware/connection');

const app = express();

app.set('view engine' ,  'ejs');
app.use(express.json());
app.use(express.urlencoded({extended: false}));
app.use(cookieParser());
app.use(express.static('public'));


//Routes to be imported
const authRoutes = require('./routes/authRoutes');
const admin = require('./routes/user/administrator/accounts');
const extracurricular = require('./routes/user/student/extracurricular');
const staff = require('./routes/user/student/staff');

//Routes
app.use(authRoutes);
app.use(admin);
app.use(extracurricular);
app.use(staff);


app.listen(3000 , ()=>console.log("server running on port 3000"));

//Example pages 
app.get('/home' , authentication.isStudentLoggedIn ,(req , res)=> {
    console.log(req.userData);
    res.render('home' , { user : req.userData });
});

//sample page after instructor logged in - to be deleted
app.get('/instructor/home' , authentication.isInstructorLoggedIn ,(req , res)=> {
    console.log(req.userData);
    res.render('home' , { user : req.userData  });
});

//sample page after Admin logged in - to be deleted
app.get('/admin/home' , authentication.isAdminLoggedIn ,(req , res)=> {
    console.log(req.userData);
    res.render('home' , { user : req.userData  });
});



/***********************START YOUR CODE HERE******************************/










