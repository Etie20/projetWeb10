const express = require('express');
const router = express.Router();
const signUp = require('../../../services/bde/signup/SignUp');

router.get('/signupStudent', async  (req, res, next) => {
    try {
        res.json(await signUp.getSignUpStudent());
    } catch (err) {
        console.error(`ERROR when get SignUpStudents`);
        next(err);
    }
});
router.get('/signupStudent/:email', async  (req, res, next) => {
    try {
        res.json(await signUp.getSignUpStudentByEmail(req.params.email));
    } catch (err) {
        console.error(`ERROR when get SignUpStudents`);
        next(err);
    }
});

router.get('/signupSalaries', async  (req, res, next) => {
    try {
        res.json(await signUp.getSignUpSalaries());
    } catch (err) {
        console.error(`ERROR when get SignUpStudents`);
        next(err);
    }
});



router.post('/signupStudent', async (req, res, next) => {
    try {
        res.json(await signUp.SignUpStudent(req.body));
    } catch (err) {
        console.error(`ERROR when SignUpStudent`);
        next(err);
    }
});

router.post('/signupSalaries', async (req, res, next) => {
    try {
        res.json(await signUp.SignUpSalaries(req.body));
    } catch (err) {
        console.error(`ERROR when SignUpSalaries`);
        next(err);
    }
});

module.exports = router;