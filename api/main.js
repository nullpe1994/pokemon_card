const express = require('express');
const router = express();
const port = 3001;
const conection = require('./common/postgres.js');
const login = require('./apis/login.js');

router.get('/login', (req, res) => {
    const pool = conection.conection();
    login.login(req, res, pool);
});

router.post('/login', (req, res) => {
    const pool = conection.conection();
    login.login(req, res, pool);
});

router.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`);
});
