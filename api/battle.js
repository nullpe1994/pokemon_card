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
let rooms = [];
let player = {};

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
	// console.log('a user connected');

	// プライベート対戦ルーム入室
	socket.on('private', (test) => {
		let room = '';
		oppName = test.opponentId;
		// プライベートルーム作成
		if (rooms.includes(`${test.opponentId}:${test.yourId}`)) {
			room = `${test.opponentId}:${test.yourId}`;
			socket.broadcast.to(room).emit('private_connect', {opponentId : `${test.yourId}`});
			io.to(socket.id).emit('private_connect', {opponentId : `${test.opponentId}`});
		} else {
			room = `${test.yourId}:${test.opponentId}`;
			rooms.unshift(room);
			io.to(socket.id).emit('private_connect', {opponentId : ``});
		}
		player[test.yourId] =  {
			'deck': test.deck,
			'hand': [],
			'sideCard': [],
			'bench': [],
			'trash': [],
			'battleField': []
		}
		
		// console.log(player);
		socket.join(room);
		console.log(`join:${test.yourId}`);
		console.log(rooms.length);
	});

	// S05. client_to_serverイベント・データを受信する
    socket.on('client_to_server', function(data) {
        // S06. server_to_clientイベント・データを送信する
        io.to(room).emit('server_to_client', {value : data.value});
    });

	// デッキの残り枚数
	socket.on('deck', (userState) => {
		io.to(socket.id).emit('getDeck', {deckSize: player[userState.yourId].deck.length});
	});

	socket.on('oppDeck', (oppState) => {
		io.to(socket.id).emit('getOppDeck', {deckSize: player[oppState.oppId].deck.length});
	});
	
	// 現在の手札の詳細
	socket.on('hand', (userState) => {
		io.to(socket.id).emit('getHand', { hand: player[userState.yourId].hand });
	});

	// サイドカードの枚数
	socket.on('sideCard', (userState) => {
		io.to(socket.id).emit('getSideCard', { 
			sideCard: player[userState.yourId].sideCard
		});
	});

	// トラッシュカードの枚数
	socket.on('trash', (userState) => {
		io.to(socket.id).emit('getTrash', {
			trash: player[userState.yourId].trash
		});
	});

	// バトルフィールドの詳細
	socket.on('battleField', (userState) => {
		io.to(socket.id).emit('getBattleField', { 
			battleField: player[userState.yourId].battleField
		});
	});

	socket.on('oppBattleField', (oppState) => {
		io.to(socket.id).emit('getOppBattleField', {
			battleField: player[oppState.oppId].battleField
		});
	});

	// バトルフィールド設置関数
	socket.on('callToBattleField', (userState) => {
		player[userState.yourId].battleField = player[userState.yourId].hand[userState.index];
		player[userState.yourId].hand.splice(userState.index, 1);
	});

	// トレーナーズカード使用関数
	socket.on('useSpellCard', (userState) => {
		let cardName = player[userState.yourId].hand[userState.index].card_name;

		player[userState.yourId].trash.push(
			player[userState.yourId].hand[userState.index].img_url
		);
		player[userState.yourId].hand.splice(userState.index, 1);
		whichSpells(cardName, userState.yourId, userState.oppId);
	});

	const whichSpells = (cardName, yourId, oppId) => {
		let yourHandCnt = player[yourId].hand.length;
		let oppHandCnt = player[oppId].hand.length;
		switch(cardName) {
			case '博士の研究（アララギ博士）':
				for (let i=0; i<yourHandCnt; i++) {
					player[yourId].trash.push(
						player[yourId].hand[0]
					);
					player[yourId].hand.splice(0, 1);
				}
				for (let i=0; i<7; i++) {
					player[yourId].hand.push(
						player[yourId].deck.pop()
					);
				}
				break;
			case 'マリィ':
				let yourHand = player[yourId].hand;
				for (let i=yourHandCnt-1; 0<i; i--) {
					let r = Math.floor(Math.random() * (i+1));
					let tmp = yourHand[i];
					yourHand[i] = yourHand[r];
					yourHand[r] = tmp;
				}
				for (let i=0; i<yourHandCnt; i++) {
					player[yourId].deck.splice(0, 0, yourHand[i]);
				}
				player[yourId].hand = [];
				for (i=0; i<5; i++) Draw(yourId);
				
				let oppHand = player[oppId].hand;
				console.log(player[oppId].hand);
				for (let i=oppHandCnt-1; 0<i; i--) {
					let r = Math.floor(Math.random() * (i+1));
					let tmp = oppHand[i];
					oppHand[i] = oppHand[r];
					oppHand[r] = tmp;
				}
				for (let i=0; i<oppHandCnt; i++) {
					player[oppId].deck.splice(0, 0, oppHand[i]);
				}
				player[oppId].hand = [];
				for (i=0; i<4; i++) Draw(oppId);
				console.log(player[oppId].hand);
				break;
		}
	}

	// デッキシャッフル関数
	socket.on('shuffleTheDeck', (userState) => {
		let deck = player[userState.yourId].deck
		for (let j=0; j<7; j++) {
			for (let i=(deck.length - 1); 0 < i; i--) {
				let r = Math.floor(Math.random() * (i + 1));
		
				let tmp = deck[i];
				deck[i] = deck[r];
				deck[r] = tmp;
			}
		}
		player[userState.yourId].deck = deck;
	});

	const Draw = (userName) => {
		player[userName].hand.push(
			player[userName].deck.pop()
		);
	}
	
	// ドロー関数
	socket.on('draw', (userState) => {
		player[userState.yourId].hand.push(
			player[userState.yourId].deck.pop()
		);
	});

	// サイドカード設置関数
	socket.on('setSideCard', (userState) => {
		player[userState.yourId].sideCard.push(
			player[userState.yourId].deck.pop()
		);
	});

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
