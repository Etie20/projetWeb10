const express = require('express');
const router = express.Router();
const produit = require('../services/produit');

//CREATE product
router.post('/', async (req, res, next) => {
    try {
        res.json(await produit.createProduct(req.body));
    } catch (err) {
        console.error(`ERROR`);
        next(err);
    }
});

//GET products
router.get('/',async (req, res, next)=>{
    try {
        res.json(await produit.getAllProducts());
    } catch (err) {
        console.log(`Erreur lors du chargement des produits`);
        next(err);
    }
});
//GET one product by id
router.get('/:id', async (req, res, next) => {
    try {
        const product = await produit.getProductById(req.params.id);
        if (!product){
            return res.status(404).send();
        }
        res.json(product);
    } catch (err) {
        res.status(500).send();
        next(err);
    }
});

//DELETE one product by id
router.delete('/:id', async (req, res, next) => {
    try {
        const product = await produit.deleteProductById(req.params.id);
        if (!product){
            return res.status(404).send;
        }
        res.send(product)
    } catch (err) {
        res.status(500).send();
        next(err);
    }
});


module.exports = router;