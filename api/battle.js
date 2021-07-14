const express = require('express');
const router = express();
const http = require('http').createServer(router);
var io = require('socket.io')(http,{
	cors: {
		origin: "*",
	},
});

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
		io.to(socket.id).emit('broadcast', {
			deckSize: room.player[yourId].deck.length,
			hand: room.player[yourId].hand,
			sideCard: room.player[yourId].sideCard,
			trash: room.player[yourId].trash,
			battleField: room.player[yourId].battleField,
			yourTurn: room.player[yourId].yourTurn
		});
		socket.broadcast.to(roomKey).emit('oppBroadcast', {
			oppDeckSize: room.player[yourId].deck.length,
			oppHand: room.player[yourId].hand,
			oppBattleField: room.player[yourId].battleField
		});
	}

	const updateOppField = (oppId) => {
		const room = getRoom(oppId);
		socket.broadcast.to(roomKey).emit('broadcast', {
			deckSize: room.player[oppId].deck.length,
			hand: room.player[oppId].hand,
			sideCard: room.player[oppId].sideCard,
			trash: room.player[oppId].trash,
			battleField: room.player[oppId].battleField
		});
		io.to(socket.id).emit('oppBroadcast', {
			oppDeckSize: room.player[oppId].deck.length,
			oppHand: room.player[oppId].hand,
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
	// 	console.log(basics);
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

	// 先攻後攻
	socket.on('chooseYourOrder', (userState) => {
		const room = getRoom(userState.yourId);
		const oppRoom = getRoom(userState.oppId);
		room.player[userState.yourId].yourTurn = userState.whichOrder;
		oppRoom.player[userState.oppId].yourTurn = !userState.whichOrder;
	});

	// ドロー関数
	socket.on('draw', (userState) => {
		const room = getRoom(userState.yourId);
		room.player[userState.yourId].hand.push(
			room.player[userState.yourId].deck.pop()
		);
		updateYourField(userState.yourId);
	});

	socket.on('oppDraw', (userState) => {
		const room = getRoom(userState.oppId);
		room.player[userState.oppId].hand.push(
			room.player[userState.oppId].deck.pop()
		);
		updateOppField(userState.oppId);
	});

	// サイドカード設置関数
	socket.on('setSideCard', (userState) => {
		const room = getRoom(userState.yourId);
		room.player[userState.yourId].sideCard.push(
			room.player[userState.yourId].deck.pop()
		);
		updateYourField(userState.yourId);
	});

	// バトルフィールド設置関数
	socket.on('callToBattleField', (userState) => {
		const room = getRoom(userState.yourId);
		room.player[userState.yourId].battleField = room.player[userState.yourId].hand[userState.index];
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

	const whichSpells = (cardName, yourId, oppId) => {
		const room = getRoom(yourId);
		const oppRoom = getRoom(oppId);
		let yourHandCnt = room.player[yourId].hand.length;
		let oppHandCnt = oppRoom.player[oppId].hand.length;
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
				let yourHand = room.player[yourId].hand;
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
				for (i=0; i<5; i++) Draw(yourId);
				
				let oppHand = oppRoom.player[oppId].hand;
				console.log(oppRoom.player[oppId].hand);
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
				for (i=0; i<4; i++) Draw(oppId);
				updateOppField(oppId);
				break;
		}
	}

	// デッキシャッフル関数
	socket.on('shuffleTheDeck', (userState) => {
		const room = getRoom(userState.yourId);
		let deck = room.player[userState.yourId].deck;
		for (let j=0; j<7; j++) {
			for (let i=(deck.length - 1); 0 < i; i--) {
				let r = Math.floor(Math.random() * (i + 1));
		
				let tmp = deck[i];
				deck[i] = deck[r];
				deck[r] = tmp;
			}
		}
		room.player[userState.yourId].deck = deck;
	});

	const Draw = (userName) => {
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
