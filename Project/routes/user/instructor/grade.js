// gradesubmit

// Lillian Alehegn ATR/4546/11
const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const app = Router();

app.get("/gradeSubmit2", authentication.isInstructorLoggedIn, (req,res) =>{
    res.render("instructor/gradeSubmit2", {error : false});
});
app.post("/gradeSubmit2", authentication.isInstructorLoggedIn, (req,res) =>{
    var sql = `INSERT INTO assessments VALUES ('${req.body.StudentID}','${req.body.nameOfAssesments}','${req.body.nameOfAssesments2}','${req.body.nameOfAssesments3}','${req.body.nameOfAssesments4}','${req.body.evaluationGrade}')`;
    connection.query(sql , (error , result) => {
        if(!error){
            res.render('instructor/gradeSubmit2', {msg : false});
        }
        else{
            console.log(error.message);
            res.render("instructor/gradeSubmit2" , {msg : true});
        }
        // res.redirect("/home")
    });

});

module.exports = app;