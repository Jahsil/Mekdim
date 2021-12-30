const { Router } = require('express');
const connection = require('../../../middleware/connection');
const authentication = require('../../../middleware/authentication.js');
const multer = require('multer');
const formidable = require('formidable');
const fs = require('fs');
const router = Router();


//KALAB YIBELTAL  ATR/5464/11  
router.get('/assign' ,authentication.isInstructorLoggedIn, (req , res)=> {
    res.render('instructor/assign' , {err: false });
});

//KALAB YIBELTAL  ATR/5464/11  
router.post('/assign',authentication.isInstructorLoggedIn,(req,res)=>{
    var form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
        if(err){
            return console.log(err.message);
        }
        console.log(files.assigm.filepath);
        var oldpath = files.assigm.filepath;
        var newpath = 'C:Files/AssignmentsUploaded/' + files.assigm.originalFilename;
        fs.rename(oldpath, newpath, function (err) {
          if (err) return res.render('assign',{err: false })
          console.log('File uploaded and moved!');
          res.render('instructor/assign',{err: true })
        });
        var sql='insert into assignments values (NULL , "'+req.userData.FullName+'" ,"'+req.userData.InstructorID+'", "'+newpath+'", "'+fields.course+'" )'
        connection.query(sql, (error , result) =>{
         if(error){
             console.log(error)
             //if error happend reloading the page and printing in the front end to fill the form again
             res.render("instructor/makeuprequest", { error: true});   
         }
       });
       
});

});


module.exports = router;

