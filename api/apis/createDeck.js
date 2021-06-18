const express = require('express');
const router = express();

exports.createDeck = function(req, res, pool) {
  console.log('hello');
  console.log(req.body);
    pool.connect( (err, client) => {
      if (err) {
        console.log(err);
      } else {
        const cardDetails = req.body.decks;
        let query = `INSERT INTO deck(
          user_id,
          deck_id,
          card_id_1, card_id_2, card_id_3, card_id_4,
          card_id_5, card_id_6, card_id_7, card_id_8,
          card_id_9, card_id_10, card_id_11, card_id_12,
          card_id_13, card_id_14, card_id_15, card_id_16,
          card_id_17, card_id_18, card_id_19, card_id_20,
          card_id_21, card_id_22, card_id_23, card_id_24,
          card_id_25, card_id_26, card_id_27, card_id_28,
          card_id_29, card_id_30, card_id_31, card_id_32,
          card_id_33, card_id_34, card_id_35, card_id_36,
          card_id_37, card_id_38, card_id_39, card_id_40,
          card_id_41, card_id_42, card_id_43, card_id_44,
          card_id_45, card_id_46, card_id_47, card_id_48,
          card_id_49, card_id_50, card_id_51, card_id_52,
          card_id_53, card_id_54, card_id_55, card_id_56,
          card_id_57, card_id_58, card_id_59, card_id_60
          ) VALUES ('${req.body.userId}',nextval('DECK_ID_SEQ')`;
          cardDetails.map((detail) => {
            for (let i=0; i<detail.array.count; i++) {
              query += `,'${detail.array.pokemon_card_id}'`;
            }
          });
        query += ')';
        console.log(query);
        client.query(query, (err, result) => {
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