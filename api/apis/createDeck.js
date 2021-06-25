const express = require('express');
const router = express();

exports.createDeck = function(req, res, pool) {
    pool.connect( (err, client) => {
      if (err) {
        console.log(err);
      } else {
        const cardDetails = req.body.decks;
        let query = `INSERT INTO deck(
          user_id,
          deck_id,
          deck_name,
          card_id
          ) VALUES ('${req.body.userId}',nextval('DECK_ID_SEQ'),'${req.body.deckName}','{`;
          cardDetails.map((detail) => {
            query += `{"${detail.array.pokemon_card_id}",`
            query += `"${detail.array.pokemon_card_name}",`
            query += `"${detail.array.count}"},`;
          });
        let s = query.slice(0, -1);
        s += `}')`;
        client.query(s, (err, result) => {
          if (err) {
            console.log(err);
          }
          // if (true) {
          //   res.header('Access-Control-Allow-Origin', '*');
          //   res.json([{
          //       url: '/decklist', // デッキリスト返還
          //       cardlist: result.rows,
          //   }]);
          // }
      });
    }
  });
};