const db = require('../models/db');
const helper = require('../helper');

async function getAllProducts(){
    const rows = await db.query(`SELECT email FROM utilisateurs`);
    return rows;
}

async function getProductById(id){
    const query = 'SELECT * FROM produits WHERE id = ?';
    const [rows, ] = await db.query(query, [id]);
    const data = helper.emptyOrRows(rows);

    if (!rows){
        throw Error("Erreur lors de la récupération du produit");
        return[];
    }
    return data;

}

async function deleteProductById(id){
    const del = await  db.query(`DELETE FROM produits WHERE id = ${id}`);
    let message = "Le produit a pas pu être supprimé";
    if(!del){
        message = "Le produit n'a pas pu être supprimé";
    }
    return message;
}

async function createProduct(product) {
    const sql = `INSERT INTO produits (nom, prix, description, solde, urlImage)
               VALUES (?, ?, ?, ?, ?)`;
    const params = [product.nom, product.prix, product.description, product.solde, product.urlImage];
    const result = await db.query(sql, params);

    let message = 'Error in creating product';

    if (result != null) {
        message = 'Product created successfully';
    }

    return message;
}

module.exports = {
    getAllProducts,
    getProductById,
    deleteProductById,
    createProduct
}


