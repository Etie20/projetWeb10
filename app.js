const express = require('express');
const app = express();
const produitRouter = require('./routes/produit');
const user = require('./routes/ucac/users');
const SignUp = require('./routes/bde/signup/signUp');
const login = require('./routes/login');

app.use(express.json());

app.use(
    express.urlencoded({
        extended: true,
    })
);

app.get('/', (req, res) => {
    res.json({message: "ok"});
});
app.use('/produits', produitRouter);
app.use('/users', user);
app.use('/signup', SignUp);
app.use('/login', login);

module.exports = app;
