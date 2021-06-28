const express = require('express');
const router = express();

exports.getDeck = function(req, res, pool) {
	pool.connect( (err, client) => {
		if (err) {
			console.log(err);
		} else {
			const userId = req.body.userId;
			client.query(`
				SELECT deck.user_id, deck.deck_id, deck.deck_name, 
				deck_cards.number_of_cards, pokemon_card.pokemon_card_id, 
				pokemon_card_name, supertype, subtypes, hp, types, evolvesFrom, 
				first_skill_type, first_skill_type_cost, first_skill_colorless_cost, 
				first_skill_attack_damage, second_skill_type, second_skill_type_cost, 
				second_skill_colorless_cost, second_skill_attack_damage, isAbilities,
				weaknesses, resistances, convertedRetreatCost, img_url 
				FROM deck_cards 
				LEFT JOIN pokemon_card ON pokemon_card.pokemon_card_id = deck_cards.card_id 
				LEFT JOIN deck ON deck.deck_id = deck_cards.deck_id 
				WHERE deck.user_id = '${userId}'`, 
				(err, result) => {
					const size = result.rows.length;
					let x = result.rows[0].deck_id;
					var deck = [];
					
					for (let i=0; i<size; i++) {
						if (x != result.rows[i].deck_id) {
							x = result.rows[i].deck_id;
							deck[i] = result.rows[i];
						} else {
							res.header('Access-Control-Allow-Origin', '*');
							res.json([{
							userDeck: deck
							}]);
							deck = [];
						}
					}
				}
			);
		}
	});
};