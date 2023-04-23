const express = require('express');
const router = express.Router();
const login = require('../services/bde/signup/SignUp');

router.post('/', async (req, res, next) => {
    try {
        res.json(await login.login(req.body));
    } catch (err) {
        console.log(err);
        next(err);
    }
});

module.exports = router;