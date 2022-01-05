const { Router } = require('express');
const connection = require('../middleware/connection');
const jwt = require('jsonwebtoken');

const router = Router();


router.get('/News' , (req , res)=> {
    res.render('guest/news' , {error: false });
});

router.get('/Calendar' , (req , res)=> {
    res.render('guest/calendar' , {error: false });
});

router.get('/blog1' , (req , res)=> {
    res.render('guest/blog1' , {error: false });
});

router.get('/blog2' , (req , res)=> {
    res.render('guest/blog2' , {error: false });
});
router.get('/blog3' , (req , res)=> {
    res.render('guest/blog3' , {error: false });
});


module.exports = router;