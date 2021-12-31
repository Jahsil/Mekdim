const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();


//Event Schedule checking by Sherif Ahmed ATR/5716/11
router
.get('/eventschedulechecking' , authentication.isStudentLoggedIn, (req, res)=> {

    res.render('student/Event_Schedule_Checking', {msg:0});
})

router
.post('/eventschedulechecking' , authentication.isStudentLoggedIn, (req, res)=> {

    //let sql = `insert into eventschedule (EventName,Date,eventvenue,Startingtime,Endtime,Eventdescription) values ( ' ${req.body.event_name} ','${req.body.event_date}', '${req.body.event_venue}', '${req.body.event_start}', '${req.body.event_end}', '${req.body.event_description}')`;
      
      


    let sql = `select * from eventschedule where Date = "${req.body.event_date}"`;
    connection.query(sql, (error, result) => {
       console.log(result);
        if(result.length == 0){
            res.render('student/Event_Schedule_Checking.ejs' , {msg:0});
        } else{
            res.render('student/Event_Schedule_Checking.ejs' , {msg:result[0]});
        }
    });
});


module.exports = router;