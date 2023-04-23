const mysql = require('mysql2/promise');
const config = require('./config');

const pool = mysql.createPool(config.db);
async function query(sql, params) {
    const [results, ] = await pool.execute(sql, params);
    return results
}

const pool2 = mysql.createPool(config.db2);
async function query2(sql, params) {
    const [results, ] = await pool2.execute(sql, params);
    return results
}
module.exports = {
    pool,
    pool2,
    query,
    query2
}