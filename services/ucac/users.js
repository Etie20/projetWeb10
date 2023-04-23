const db = require('../../models/db');
const helper = require('../../helper');

async function getByEmail(email){
    const query = `SELECT email FROM utilisateurs WHERE email = ?`
    const rows = await db.query(query, [email]);
    return rows;
}

async function getLocationAndFonctionByEmail(email){
    const query = `SELECT localisation, fonction FROM utilisateurs WHERE email = ?`;
    const row = await db.query(query, [email]);
    return row;
}


async function SignUpUsers(user){
    const query = `INSERT INTO inscrip_etudiant (email, username, password) 
                    VALUES (?, ?, ?)`;
    const params = [user.email, user.username, user.password];
    const result = await db.query2(query, params);

    let message = 'Error in creating user';

    if (result != null) {
        message = 'user created successfully';
    }

    return message;
}


module.exports = {
    getByEmail: getByEmail,
    getLocationAndFonctionByEmail: getLocationAndFonctionByEmail,
    SignUpUsers: SignUpUsers
}


