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

const port = 3000;
//Routes to be imported

const admin = require('./routes/user/administrator/accounts');

const other = require('./routes/user/student/other');
const schedule = require('./routes/user/student/schedule');
const studentService = require('./routes/user/student/studentService');

const authRoutes = require('./routes/authRoutes');
const guest = require('./routes/guest');


const AdminAccount= require('./routes/user/administrator/accounts');
const AdminApprove = require('./routes/user/administrator/approve');
const AdminSchedule = require('./routes/user/administrator/schedule');

const StudentExtracurricular = require('./routes/user/student/extracurricular');
const StudentCourse = require('./routes/user/student/course');
const StudentStaff = require('./routes/user/student/staff');
const StudentGrade = require('./routes/user/student/grade');

const InstructorCourse = require('./routes/user/instructor/courses');
const InstructorassignmentsAndProjejects = require('./routes/user/instructor/assignmentsAndProjejects');
const InstructorGrade = require("./routes/user/instructor/grade");

//Routes

app.use(admin);

app.use(other);
app.use(schedule);
app.use(studentService);


app.use(authRoutes);
app.use(guest);


app.use(AdminAccount);
app.use(AdminApprove);
app.use(AdminSchedule);

app.use(StudentExtracurricular);
app.use(StudentStaff);
app.use(StudentCourse);
app.use(StudentGrade);


app.use(InstructorCourse);
app.use(InstructorassignmentsAndProjejects);
app.use(InstructorGrade);


app.listen(port , ()=>console.log("server running on port ", port));

//Example pages 
app.get('/home' , authentication.isStudentLoggedIn ,(req , res)=> {
    // console.log(req.userData);
    res.render('student/student' , { user : req.userData });
});

//sample page after instructor logged in - to be deleted
app.get('/instructor/home' , authentication.isInstructorLoggedIn ,(req , res)=> {
    // console.log(req.userData);
    res.render('instructor/instructor' , { user : req.userData  });
});

//sample page after Admin logged in - to be deleted
app.get('/admin/home' , authentication.isAdminLoggedIn ,(req , res)=> {
    // console.log(req.userData);
    res.render('administrator/admin' , { user : req.userData  });
});
