const express = require('express');
const router = express();

exports.login = function(req, res, pool) {
  pool.connect( (err, client) => {
    if (err) {
      console.log(err);
    } else {
        const user = req.query.user;
        client.query(`SELECT user_id FROM users where user_id = '${user}';`, (err, result) => {
            console.log(result);
            if (result.rowCount === 1) {
                res.json([{
                    url: '/', // ログイン成功後ページ返還
                    userid: result.rows[0].user_id,
                }]);
            } else {
                res.json([{
                    url: '/', // ログイン失敗後ページ返還
                    errormsg: 'ログイン失敗しました'
                }]);
            }
      });
    }
  });
};
