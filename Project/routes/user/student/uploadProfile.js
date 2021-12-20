// const { Router } = require('express');
// const connection = require('../../../middleware/connection');
// const authentication = require('../../../middleware/authentication.js');

// exports.index = function(req, res){
//     message = '';
//     if(req.method == "POST"){
//         var post  = req.body;    
//         var email= post.email;
//         var mob= post.mob_no;
//         var birth_date = post.birth_date;
    
//         if (!req.files)
//                   return res.status(400).send('No files were uploaded.');
    
//           var file = req.files.uploaded_image;
//           var img_name=file.name;
    
//            if(file.mimetype == "image/jpeg" ||file.mimetype == "image/png"||file.mimetype == "image/gif" ){
                                   
//                 file.mv('public/students_uploaded_images/'+file.name, function(err) {
                               
//                     if (err)
    
//                       return res.status(500).send(err);
//                           var sql = "INSERT INTO `student`(`StudentId`,`FullName`,`Gener`,`user_name`, `password` ,`image`) VALUES ('" + "" + "''" + lname + "','" + mob + "','" + name + "','" + pass + "','" + img_name + "')";
    
//                               var query = db.query(sql, function(err, result) {
//                                    res.redirect('/home');
//                               });
//                          });
//             } else {
//               message = "This format is not allowed , please upload file with '.png','.gif','.jpg'";
//               res.render('home.ejs');
//             }
//      } else {
//         res.render('student_basic_info_form');
//      }
 
// };