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
	console.log('a user connected');

	// プライベート対戦ルーム入室
	socket.on('private', (test) => {
		let room = '';
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
		socket.join(room);
		console.log(`join:${test.yourId}`);
		console.log(rooms.length);
	});

	// S05. client_to_serverイベント・データを受信する
    socket.on('client_to_server', function(data) {
        // S06. server_to_clientイベント・データを送信する
        io.to(room).emit('server_to_client', {value : data.value});
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
