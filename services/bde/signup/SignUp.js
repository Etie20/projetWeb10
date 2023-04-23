const db = require('../../../models/db');
const {compareSync} = require("bcrypt");
const { sign } = require('jsonwebtoken');

async function getSignUpStudent(){
    const sql = `SELECT * FROM inscrip_etudiant`;
    const result = await db.query2(sql);
    if (!result){
        return []
    }
    return result;
}

async function getSignUpStudentByEmail(email){
    const sql = `SELECT * FROM inscrip_etudiant WHERE email = ?`;
    const result = await db.query2(sql, [email]);
    if (!result){
        return []
    }
    return result;
}

async function getSignUpSalaries(){
    const sql = `SELECT * FROM inscrip_salaries`;
    const result = await db.query2(sql);
    if (!result){
        return []
    }
    return result;
}

async function SignUpStudent(etudiant) {
    const sql = `INSERT INTO inscrip_etudiant(email, username, password) 
                 VALUES (?, ?, ?)`;
    const params = [etudiant.email, etudiant.username, etudiant.password];
    const result = await db.query2(sql, params);

    let message = "Erreur lors de la creation de l'utilisateur";
    if(result != null){
        message = "Création de l'utilisateur réussi";
    }
    return message;
}

async function SignUpSalaries(salaries) {
    const sql = `INSERT INTO inscrip_salaries(email, username, password) 
                 VALUES (?, ?, ?)`;
    const params = [salaries.email, salaries.username, salaries.password];
    const result = await db.query2(sql, params);

    let message = "Erreur lors de la creation de l'utilisateur";
    if(result != null){
        message = "Création de l'utilisateur réussi";
    }
    return message;
}

async function login(etudiant) {
    try {
        let verif = false;
        const result = await getSignUpStudentByEmail(etudiant.email);
        if (!result[0]) {
            return "invalid email or password";
        }
        if (etudiant.password === result[0].password) {
            verif = true;
        }
        //const results = compareSync(etudiant.password, result.password);
        if (verif) {
            result.password = undefined;
            const jsontoken = sign({result: verif}, "qwe1234", {
                expiresIn: "1h"
            });
            return "login successfully and this is your token: " + jsontoken;
        }else {
            return "you can not login now"+ verif;
        }
    } catch (err) {
        console.log(err);
    }

}

module.exports = {
    getSignUpStudent: getSignUpStudent,
    getSignUpSalaries: getSignUpSalaries,
    login: login,
    SignUpStudent: SignUpStudent,
    SignUpSalaries: SignUpSalaries,
    getSignUpStudentByEmail: getSignUpStudentByEmail,
    getUserByUserEmail: async (email, callBack) => {
        await db.pool2.query(
            `SELECT *
             FROM inscrip_etudiant
             WHERE email = ?`,
            [email],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results[0]);
            }
        );
    },
}