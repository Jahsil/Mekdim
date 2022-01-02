const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();

// Euael Mekonen ATR/1245/11

router
.get('/costSharing/accountInfo', authentication.isStudentLoggedIn, (req , res)=> {
    res.render('student/accountInfo', {msg: false});
});
router
.post('/costSharing/accountInfo', authentication.isStudentLoggedIn, (req , res) => {
    let adr = req.userData.StudentID;
    let adr1 = req.body.accinfo;
    let adr3 = req.body.foods;
    let adr4 = req.body.dorms;
    let adr5;
    if(adr3 === undefined && adr4 === undefined) adr5 = "none";
    else if(adr3 !== undefined && adr4 === undefined) adr5 = "Food";
    else if(adr3 === undefined && adr4 !== undefined) adr5 = "Dorm";
    else adr5 = "FoodAndDorm";
    let x = false;
    let sql = `INSERT INTO costsharing (StudentCostSharing, AccountNumber, ServiceChoice) VALUES ("${adr}", "${adr1}", "${adr5}")`;
    connection.query(sql, (err, result) => {
        if(err){
            x = true;
            return console.log(err.message);
        }
    });
    res.redirect("/costSharing/homeadr");
});

router
.get('/costSharing/homeadr' ,authentication.isStudentLoggedIn, (req , res)=> {
    res.render('student/homeAddress');
});
router
.post('/costSharing/homeadr' , authentication.isStudentLoggedIn, (req , res) => {
    let sql = `UPDATE costsharing 
    SET City = "${req.body.city}", Subcity = "${req.body.scity}", Woreda = "${req.body.woreda}", HouseNo = "${req.body.hnum}"
    WHERE StudentCostSharing = "${req.userData.StudentID}"`;
    connection.query(sql, (error, result) => {
        if (error){
            return console.log(error.message);
        }   
        res.redirect("/home");
    });
});

router
.get('/dormitory/Application' ,authentication.isStudentLoggedIn, (req , res)=> {
    res.render('student/Application', {msg: undefined});
});
router
.post('/dormitory/Application' , authentication.isStudentLoggedIn, (req, res) => {
    let adr = req.userData.StudentID;
    let bdr1 = req.body.dorm1;
    let bdr2 = req.body.dorm2;
    let bdr3 = req.body.dorm3;

    let sql = `INSERT INTO dormitoryreq (StuduentD, preferedComp1, preferedComp2, preferedComp3) VALUES
                ("${adr}", "${bdr1}", "${bdr2}", "${bdr3}")`;
    connection.query(sql , (error , result) => {
        if (error) {
            sql = `UPDATE dormitoryreq SET preferedComp1 = "${bdr1}", preferedComp2 = "${bdr2}", 
                    preferedComp3 = "${bdr3}" WHERE StuduentD = "${adr}"`;
            connection.query(sql, (err, re) => {
                if (err) return console.log(err.message);
            });
            res.render("student/Application", {msg: "Updated Your previous Choices."});
            return console.error(error.message + " => \"UPDATING\" ...");
        }
        sql = `UPDATE dormitory SET RequestStatus = "pending" WHERE StudentD = "${adr}"`;
        connection.query(sql, (error, result) => {
            if(error) return console.log(error.message);

            if (result.affectedRows === 0){
                sql = `INSERT INTO dormitory (StudentD, RequestStatus) VALUES ("${adr}", "pending")`;
                connection.query(sql, (er, re) => {
                    if (er) return console.log(er.message);
                });
            }
        });
        res.redirect("/dormitory/placement");
     });
});

router
.get('/dormitory/placement' , authentication.isStudentLoggedIn, (req , res)=> {
    let adr = req.userData.StudentID;
    let sql =  `select * from dormitory WHERE StudentD = "${adr}"`;
    connection.query(sql , (error , result) => {
        let r;
        if (result !==undefined && result.length > 0 ) {
            const adr0 = result[0].blockNumber;
            const adr1 = result[0].roomNumber;
            const adr2 = result[0].RequestStatus;
            if (adr2 !== "denied"){
                if (adr2 === "approved"){
                    if(adr0 == null || adr1 == null) r = null;
                    else {
                        // the roommate failure feature
                        // const sql0 = `select * from dormitory WHERE blockNumber = ${adr0} AND roomNumber = ${adr1}`;
                        // connection.query(sql0, (error, result) => {
                        //     if (error) return console.log(error.message);
                        // });
                        r = {
                            dormStatus: adr2,
                            blockNumber: adr0,
                            roomNumber: adr1
                        };
                    }
                } else r = { dormStatus: adr2};
            }
            res.render("student/placement", {placement: r});
        }
        else res.render('student/placement' , {placement: null});
     });
});

module.exports = router;