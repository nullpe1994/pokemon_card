const express = require('express');
const router = express();
const http = require('http').createServer(router);
var io = require('socket.io')(http,{
	cors: {
		origin: "*",
	},
});

const deckUtil = require('./util/deckUtil.js');

// config
require('dotenv').config();
const url = process.env.API_BATTLE_URL; // 対戦用api url
const port = process.env.API_BATTLE_PORT; // 対戦用api port

// ルーム管理用配列
let rooms = {};
let roomPlayers = {};

// express設定
router.use(express.json())
router.use(function(req, res, next) {
	res.header("Access-Control-Allow-Origin", "*");
	res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
	next();
});

// httpをlisten
http.listen(port, () => {
	console.log(`Example app listening at ${url}${port}`);
});

router.get('/', (req, res) => {});

io.on('connection', (socket) => {
	//ユーザーのソケット接続時のイベント
	let roomKey = '';
	// console.log('a user connected');

	const twoDice = () => {
		return Math.ceil(Math.random()*6) + Math.ceil(Math.random()*6); 
	}
	// プライベート対戦ルーム入室
	socket.on('private', (userState) => {
		roomKey =  `${userState.oppId}:${userState.yourId}`;
		let diceRoll = true;

		const player =  {
			'deck': userState.deck,
			'hand': [],
			'sideCard': [],
			'bench': [],
			'trash': [],
			'battleField': [],
			'dice': 0
		}
		// プライベートルーム作成
		if (rooms[roomKey]) {
			rooms[roomKey].player[userState.yourId] = player;
			roomPlayers[userState.yourId] = roomKey;
			rooms[roomKey].player[userState.yourId].dice = twoDice();

			while(diceRoll) {
				if (rooms[roomKey].player[userState.yourId].dice > rooms[roomKey].player[userState.oppId].dice) {
					rooms[roomKey].status.whichTurn = userState.yourId;
					diceRoll = false;
				} else if (rooms[roomKey].player[userState.yourId].dice < rooms[roomKey].player[userState.oppId].dice){
					rooms[roomKey].status.whichTurn = userState.oppId;
					diceRoll = false;
				} else {
					rooms[roomKey].player[userState.yourId].dice = twoDice();
					rooms[roomKey].player[userState.oppId].dice = twoDice();
				}
			}

			socket.broadcast.to(roomKey).emit('private_connect', { 
				oppId : `${userState.yourId}` ,
				whichTurn: rooms[roomKey].status.whichTurn
			});
			io.to(socket.id).emit('private_connect', { 
				oppId : `${userState.oppId}`,
				whichTurn: rooms[roomKey].status.whichTurn
			});
		} else {
			roomKey = `${userState.yourId}:${userState.oppId}`;
			roomPlayers[userState.yourId] = roomKey;

			const status = {
				phase: 0,
				whichTurn: '',
			}
			rooms[roomKey] = { 
				status: status,
				player: {
					[userState.yourId] : player,
				}
			};
			rooms[roomKey].player[userState.yourId].dice = twoDice();

			io.to(socket.id).emit('private_connect', { oppId : `` });
		}

		socket.join(roomKey);
		console.log(`join:${userState.yourId}`);
	});

	// S05. client_to_serverイベント・データを受信する
    socket.on('client_to_server', function(data) {
        // S06. server_to_clientイベント・データを送信する
        io.to(room).emit('server_to_client', {value : data.value});
    });

	const getRoom = (userName) => {
		return rooms[roomPlayers[userName]];
	}

	const updateYourField = (yourId) => {
		const room = getRoom(yourId);
		io.to(roomKey).emit('statuses', {
			phase: room.status.phase,
			whichTurn: room.status.whichTurn
		});
		io.to(socket.id).emit('broadcast', {
			deckSize: room.player[yourId].deck.length,
			hand: room.player[yourId].hand,
			sideCard: room.player[yourId].sideCard,
			bench: room.player[yourId].bench,
			trash: room.player[yourId].trash,
			battleField: room.player[yourId].battleField
		});
		socket.broadcast.to(roomKey).emit('oppBroadcast', {
			oppDeckSize: room.player[yourId].deck.length,
			oppHand: room.player[yourId].hand,
			oppSideCard: room.player[yourId].sideCard,
			oppBench: room.player[yourId].bench,
			oppTrash: room.player[yourId].trash,
			oppBattleField: room.player[yourId].battleField
		});
	}

	const updateOppField = (oppId) => {
		const room = getRoom(oppId);
		socket.broadcast.to(roomKey).emit('broadcast', {
			deckSize: room.player[oppId].deck.length,
			hand: room.player[oppId].hand,
			sideCard: room.player[oppId].sideCard,
			bench: room.player[oppId].bench,
			trash: room.player[oppId].trash,
			battleField: room.player[oppId].battleField
		});
		io.to(socket.id).emit('oppBroadcast', {
			oppDeckSize: room.player[oppId].deck.length,
			oppHand: room.player[oppId].hand,
			oppSideCard: room.player[oppId].sideCard,
			oppBench: room.player[oppId].bench,
			oppTrash: room.player[oppId].trash,
			oppBattleField: room.player[oppId].battleField
		});
	}

	// 種ポケモン？
	// socket.on('noBasic', (userState) => {
	// 	let hand = player[userState.yourId].hand;
	// 	let noBasic = true;
	// 	let basics = hand.map(card => {
	// 		return card.subtypes.filter(subtype => {
	// 			if (subtype === 2) noBasic = false;
	// 		});
	// 	});
	// 	basics = [];
	// 	if (noBasic) io.to(socket.id).emit('getNoBasic', { basic: noBasic });
	// 	else io.to(socket.id).emit('getNoBasic', { basic: noBasic });
	// });

	// マリガン
	socket.on('mulligan', (userState) => {
		const room = getRoom(userState.yourId);
		let handCnt = player[userState.yourId].hand.length;
		for (let i=0; i<handCnt; i++) {
			room.player[userState.yourId].deck.push(
				room.player[userState.yourId].hand.pop()
			);
		}
		updateYourField(userState.yourId);
	});

	// ドロー関数
	socket.on('draw', (userState) => {
		draw(userState.yourId);
		updateYourField(userState.yourId);
	});

	socket.on('oppDraw', (userState) => {
		draw(userState.oppId);
		updateOppField(userState.oppId);
	});

	// サイドカード設置関数
	const setSideCards = (userName) => {
		const room = getRoom(userName);
		for (let i=0; i<6; i++) {
			room.player[userName].sideCard.push(
				room.player[userName].deck.pop()
			);
		}
	}

	// バトルフィールド設置関数
	socket.on('callToBattleField', (userState) => {
		const room = getRoom(userState.yourId);
		if(room.status.phase === 0 && room.player[userState.oppId].battleField.length ===0) {
			setSideCards(userState.yourId);
		} else if(room.status.phase === 0 && room.player[userState.oppId].battleField.length !==0) {
			setSideCards(userState.yourId);
			room.status.phase++;
			draw(room.status.whichTurn);
			room.status.phase++;
			updateOppField(userState.oppId);
		}
		room.player[userState.yourId].battleField = room.player[userState.yourId].hand[userState.index];
		room.player[userState.yourId].hand.splice(userState.index, 1);
		updateYourField(userState.yourId);
	});

	// ベンチ設置関数
	socket.on('callToBench', (userState) => {
		const room = getRoom(userState.yourId);
		room.player[userState.yourId].bench.push(
			room.player[userState.yourId].hand[userState.index]
		);
		room.player[userState.yourId].hand.splice(userState.index, 1);
		updateYourField(userState.yourId);
	});

	// トレーナーズカード使用関数
	socket.on('useSpellCard', (userState) => {
		const room = getRoom(userState.yourId);
		let cardName = room.player[userState.yourId].hand[userState.index].card_name;
		room.player[userState.yourId].trash.push(
			room.player[userState.yourId].hand[userState.index].img_url
		);
		room.player[userState.yourId].hand.splice(userState.index, 1);
		whichSpells(cardName, userState.yourId, userState.oppId);
		updateYourField(userState.yourId);
	});

	const cardUtil = (cardDetail) => {
		const room = getRoom(cardDetail.yourId);
		io.to(socket.id).emit('searchRequest', {
			deck: room.player[cardDetail.yourId].deck,
			searchSort: cardDetail.sortDigit,
			contentText: cardDetail.cardText,
			howMany: cardDetail.howMany,
			whichSort: cardDetail.whichSort,
			displayGallery: true
		});
	}

	const whichSpells = (cardName, yourId, oppId) => {
		const room = getRoom(yourId);
		const oppRoom = getRoom(oppId);
		let yourHandCnt = room.player[yourId].hand.length;
		let oppHandCnt = oppRoom.player[oppId].hand.length;
		let yourHand = [];
		const cardDetail = {
			yourId: yourId,
			sortDigit: 0,
			cardText: '',
			whichSort: '',
			howMany: 0
		}
		switch(cardName) {
			case '博士の研究（アララギ博士）':
				for (let i=0; i<yourHandCnt; i++) {
					room.player[yourId].trash.push(
						room.player[yourId].hand[0]
					);
					room.player[yourId].hand.splice(0, 1);
				}
				for (let i=0; i<7; i++) {
					room.player[yourId].hand.push(
						room.player[yourId].deck.pop()
					);
				}
				break;
			case 'マリィ':
				yourHand = room.player[yourId].hand;
				for (let i=yourHandCnt-1; 0<i; i--) {
					let r = Math.floor(Math.random() * (i+1));
					let tmp = yourHand[i];
					yourHand[i] = yourHand[r];
					yourHand[r] = tmp;
				}
				for (let i=0; i<yourHandCnt; i++) {
					room.player[yourId].deck.splice(0, 0, yourHand[i]);
				}
				room.player[yourId].hand = [];
				for (i=0; i<5; i++) draw(yourId);
				
				let oppHand = oppRoom.player[oppId].hand;
				for (let i=oppHandCnt-1; 0<i; i--) {
					let r = Math.floor(Math.random() * (i+1));
					let tmp = oppHand[i];
					oppHand[i] = oppHand[r];
					oppHand[r] = tmp;
				}
				for (let i=0; i<oppHandCnt; i++) {
					oppRoom.player[oppId].deck.splice(0, 0, oppHand[i]);
				}
				oppRoom.player[oppId].hand = [];
				for (i=0; i<4; i++) draw(oppId);
				updateOppField(oppId);
				break;
			case '冒険家の発見':
				cardDetail['sortDigit'] = [21];
				cardDetail['cardText'] = '冒険家の発見: Vポケモンを3枚まで選んでください';
				cardDetail['howMany'] = 3;
				cardDetail['whichSort'] = 'subtypes';
				cardUtil(cardDetail);
				break;
			case 'レベルボール':
				cardDetail['sortDigit'] = 90;
				cardDetail['cardText'] = 'レベルボール: HPが90以下のポケモンを1枚選んでください';
				cardDetail['howMany'] = 1;
				cardDetail['whichSort'] = 'hp';
				cardUtil(cardDetail);
				break;
			case 'しんかのおこう':
				cardDetail['sortDigit'] = [0, 9, 16, 17, 22];
				cardDetail['cardText'] = 'しんかのおこう: 進化ポケモンを1枚選んでください';
				cardDetail['howMany'] = 1;
				cardDetail['whichSort'] = 'subtypes';
				cardUtil(cardDetail);
				break;
			case 'クイックボール':
				cardDetail['sortDigit'] = [2];
				cardDetail['cardText'] = 'クイックボール: たねポケモンを1枚選んでください';
				cardDetail['howMany'] = 1;
				cardDetail['whichSort'] = 'subtypes';
				cardUtil(cardDetail);
				break;
			default: 
				console.log('カードの関数が無いよ！');
		}
	}
	// デッキサーチ関数
	socket.on('searchCardsFromDeck', (userState) => {
		const aryMax = function (a, b) {return Math.max(a, b);}
		const room = getRoom(userState.yourId);
		let getCards = [...userState.getCards];
		const howMany = getCards.length;
		let newDeck = room.player[userState.yourId].deck;

		for (let i=0; i<howMany; i++) {
			let max = getCards.reduce(aryMax);
			room.player[userState.yourId].hand.push(newDeck[max]);
			newDeck.splice(max, 1);
			getCards.forEach((getCard, index) => {
				if (getCard == max) getCards.splice(index, 1);
			});
		}
		room.player[userState.yourId].deck = deckUtil.shuffle(newDeck);
		updateYourField(userState.yourId);
	});

	// pay cost function
	socket.on('requireCost', (userState) => {
		const room = getRoom(userState.yourId);
		room.player[userState.yourId].trash.push(
			room.player[userState.yourId].hand[userState.index].img_url
		);
		room.player[userState.yourId].hand.splice(userState.index, 1);
		updateYourField(userState.yourId);
	});

	// デッキシャッフル関数
	socket.on('shuffleTheDeck', (userState) => {
		const room = getRoom(userState.yourId);
		let deck = room.player[userState.yourId].deck;
		room.player[userState.yourId].deck = deckUtil.shuffle(deck);
	});

	const draw = (userName) => {
		const room = getRoom(userName);
		room.player[userName].hand.push(
			room.player[userName].deck.pop()
		);
	}

	// 対戦相手へ送信受信時
	socket.on('you_to_opponent', (test) => {
		console.log(test);
		io.emit("test", test);
	});
	//ソケット切断時のイベント
	socket.on('disconnect', () => {
		console.log('user disconnected');
	});
});
