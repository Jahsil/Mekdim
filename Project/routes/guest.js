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



module.exports = router;