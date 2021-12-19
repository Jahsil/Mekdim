const jwt = require("jsonwebtoken");

module.exports = {
    isStudentLoggedIn: (req, res, next) => {
        try {
          const token = req.cookies.jwt;
          const decoded = jwt.verify(
            token,
            'SECRETKEY'
          );
          req.userData = decoded;
          next();
        } catch (err) {
          return res.redirect('/login');
        }
      } ,
      isInstructorLoggedIn: (req, res, next) => {
        try {
          const tokenn = req.cookies.jwt;
          const decodedd = jwt.verify(
            tokenn,
            'SECRET'
          );
          req.userData = decodedd;
          next();
        } catch (err) {
          return res.redirect('/login/instructor');
        }
      } ,
      isAdminLoggedIn: (req, res, next) => {
        try {
          const tokenn = req.cookies.jwt;
          const decodedd = jwt.verify(
            tokenn,
            'SECRETADMIN'
          );
          req.userData = decodedd;
          next();
        } catch (err) {
          return res.redirect('/login/admin');
        }
      }
}

