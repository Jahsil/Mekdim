const express = require("express");
const authentication = require('../../middleware/authentication');
const connection = require("../../dB/db");

const projandassign = express.Router();

projandassign.route("/")
    .get(authentication.isStudentLoggedIn, (req , res)=> {
    let sql = `SELECT * FROM course_student WHERE StudentInCourse = "${req.userData.StudentID}"`;
    let temp = [];
    connection.query(sql, (error, result) => {
        if(error) return console.log(error.message);
        for(let i = 0; i < result.length; i++){
            let sql1 = `SELECT * FROM assignments WHERE Course = "${result[i].CourseChosen}"`;
            connection.query(sql1, (err, res1) => {
                if(res1.length === 0) return;

                temp.push({
                    courseName: res1[0].Course,
                    path: res1[0].AssignmentPath
                });
                if (i === result.length - 1){
                    if(temp.length === 0){
                        res.render("ProjandAssign/projectandassignment", {msg: null});
                        return;
                    }
                    res.render("ProjandAssign/projectandassignment", {msg: temp});
                }

            });
        }
    });
});

module.exports = projandassign;