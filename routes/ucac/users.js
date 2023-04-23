const express = require('express');
const router = express.Router();
const user = require('../../services/ucac/users');
const produit = require("../../services/produit");


//GET email BY email
router.get('/:email', async (req, res, next) => {
    try {
        const email = await user.getByEmail(req.params.email);
        if (!email){
            return res.status(404).send();
        }
        res.json(email);
    } catch (err) {
        res.status(500).send();
        next(err);
    }
});
//GET location BY email
router.get('/UcacInfo/:email', async (req, res, next) => {
    try {
        const location = await user.getLocationAndFonctionByEmail(req.params.email);
        if (!location){
            return res.status(404).send();
        }
        res.json(location);
    } catch (err) {
        res.status(500).send();
        next(err);
    }
});

//CREATE user
router.post('/', async (req, res, next) => {
    try {
        res.json(await user.SignUpUsers(req.body));
    } catch (err) {
        console.error(`ERROR`);
        next(err);
    }
});

module.exports = router;