const express = require("express");
const authentication = require('../../middleware/authentication');
const connection = require("../../dB/db");
const formidable = require('formidable');
const fs = require('fs');

const projandassSubmition = express.Router();

projandassSubmition.route("/")
.get(authentication.isStudentLoggedIn, (req, res) => {
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
                        res.render("ProjandAssign/submitpage", {msg: null});
                        return;
                    }
                    res.render("ProjandAssign/submitpage", {msg: temp});
                }
            });
        }
    });
})
.post(authentication.isStudentLoggedIn, (req, res) => {
    let form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
        if(err) return console.log(err.message);
        let oldpath = files.assFile.filepath;
        let newpath = `C:/Users/Omen/Downloads/justtring/${files.assFile.originalFilename}`;
        fs.rename(oldpath, newpath, function (err) {
            if (err) return console.log(err.message);
            console.log("File uploaded and moved!");
        });
        let sql = `INSERT into assignmentsubmission (Student, Assignment, course) VALUES ("${req.userData.StudentID}", "${newpath}", "${fields.courses}")`;
        connection.query(sql, (error, result) => {
            if(error) return console.log(error.message);
            res.redirect("/projectandassignment");
        });
    });
});
module.exports = projandassSubmition;

