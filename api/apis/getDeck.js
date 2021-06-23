const express = require('express');
const router = express();

exports.getDeck = function(req, res, pool) {
  pool.connect( (err, client) => {
    if (err) {
      console.log(err);
    } else {
        const userId = req.body.userId;
        client.query(`select deck.user_id, deck.deck_id, deck.deck_name, deck.card_id
                      from deck 
                      where user_id = '${userId}'`, (err, result) => {
            if (true) {
                res.header('Access-Control-Allow-Origin', '*');
                res.json([{
                    userDeck: result.rows
                }]);
            }
      });
    }
  });
};