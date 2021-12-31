const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');

const router = Router();


//Event Scheduling By Sherif Ahmed  ATR/5716/11
router
.get('/eventschedule' , authentication.isAdminLoggedIn, (req, res)=> {

    res.render('administrator/Event_Scheduling' ,{error:false} );
})

router
.post('/eventschedule' , authentication.isAdminLoggedIn, (req, res)=> {

    let sql = `insert into eventschedule (EventName,Date,eventvenue,Startingtime,Endtime,Eventdescription) values ( ' ${req.body.event_name} ','${req.body.event_date}', '${req.body.event_venue}', '${req.body.event_start}', '${req.body.event_end}', '${req.body.event_description}')`;

    // let sql2 = 'select * from eventschedule where Date = ' + req.body.event_date;
    // console.log(req.body.event_date);
    connection.query(sql, (error, result) => {
       
        if(error){
            console.log(error.message);
            res.render('administrator/Event_Scheduling' , {error:result[0]});
        } else{
            res.render('administrator/Event_Scheduling' , {error:0});
        }
    });
});




module.exports = router;