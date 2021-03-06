\c postgres
DROP DATABASE pokemon;
CREATE DATABASE pokemon;
\c pokemon
CREATE TABLE users (
    user_id varchar(16) NOT NULL,
    password varchar(16),
    isDelete varchar(1) default '0',
    PRIMARY KEY (user_id)
);

CREATE TABLE deck (
    user_id varchar(16) NOT NULL,
    deck_id integer NOT NULL,
    deck_name text,
    card_id text[][],
    update date default CURRENT_TIMESTAMP NOT NULL,
    isDelete varchar(1) default '0' NOT NULL,
    PRIMARY KEY (deck_id)
);

CREATE TABLE pokemon_card (
    pokemon_card_id varchar (8) NOT NULL,
    pokemon_card_name text NOT NULL,
    img_url text NOT NULL,
    isDelete varchar(1) default '0' NOT NULL,
    PRIMARY KEY (pokemon_card_id)
);

CREATE SEQUENCE DECK_ID_SEQ
    increment BY 1
    maxvalue 99999999
    START WITH 1
    NO CYCLE
;

INSERT INTO users VALUES ('master','114514','0');

-- S-P 171 ポケモンカードゲームソード&シールド プロモカード
INSERT INTO pokemon_card VALUES ('S-P001', 'ピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037601_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P002', 'シブヤのピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037602_P_SHIBUYANOPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P003', 'レックウザ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037603_P_REKKUUZA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P004', 'ウールー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037610_P_URU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P005', 'ホップ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037604_T_HOPPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P006', 'ヒバニー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037605_P_HIBANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P007', 'サルノリ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037606_P_SARUNORI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P008', 'メッソン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037607_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P009', '基本草エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037764_E_KIHONKUSAENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P010', '基本炎エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037765_E_KIHONHONOOENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P011', '基本水エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037766_E_KIHONMIZUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P012', '基本雷エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037767_E_KIHONKAMINARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P013', '基本超エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037768_E_KIHONCHOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P014', '基本闘エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037769_E_KIHONTOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P015', '基本悪エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037770_E_KIHONAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P016', '基本鋼エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037771_E_KIHONKOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P017', 'きずぐすり', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037772_T_KIZUGUSURI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P018', 'なんでもなおし', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037773_T_NANDEMONAOSHI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P019', 'モンスターボール', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037774_T_MONSUTABORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P020', 'コオリッポV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037775_P_KOORIPPOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P021', 'ヒメンカ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037776_P_HIMENKA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P022', 'エースバーン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037777_P_ESUBAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P023', 'マンタイン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037778_P_MANTAIN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P024', 'ピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037779_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P025', 'ガラル ポニータ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037780_P_GARARUPONITA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P026', 'ヨルノズク', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037781_P_YORUNOZUKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P027', 'ビート', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037782_T_BITO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P028', 'ニャースV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037608_P_NYASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P029', 'ニャースVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037609_P_NYASUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P030', 'ジュラルドン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037783_P_JURARUDON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P031', 'ともだちてちょう', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037791_T_TOMODACHITECHOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P032', 'モルペコ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037792_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P033', 'バチンウニV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037793_P_BACHINUNIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P034', 'ヒバニー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037797_P_HIBANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P035', 'モルペコ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037884_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P036', '救助隊DXのピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037989_P_KYUUJOTAIDXNOPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P037', 'ダイオウドウV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037990_P_DAIOUDOUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P038', 'ブースター', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037991_P_BUSUTA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P039', 'ルクシオ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037992_P_RUKUSHIO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P040', 'ポットデスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037993_P_POTTODESUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P041', 'ミブリム', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037994_P_MIBURIMU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P042', 'タンドン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037995_P_TANDON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P043', 'ヤブクロン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037996_P_YABUKURON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P044', 'イーブイ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037997_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P045', '逆境グローブ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037998_T_GYAKKYOUGUROBU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P046', 'ソニア', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037999_T_SONIA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P047', 'バチンウニ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038000_P_BACHINUNI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P048', 'ストリンダーV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038001_P_SUTORINDAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P049', 'スピード雷エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038002_E_SUPIDOKAMINARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P050', 'メッソン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038003_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P051', 'きずぐすり', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038004_T_KIZUGUSURI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P052', 'ふしぎなアメ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038005_T_FUSHIGINAAME.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P053', 'ポケモンいれかえ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038006_T_POKEMONIREKAE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P054', 'モンスターボール', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038007_T_MONSUTABORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P055', 'げんきのハチマキ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038008_T_GENKINOHACHIMAKI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P056', 'ビート', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038009_T_BITO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P057', 'ポケモンごっこ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038010_T_POKEMONGOKKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P058', 'ホップ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038011_T_HOPPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P059', 'イエッサンV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038643_P_IESSANV.jpg', '0');

INSERT INTO pokemon_card VALUES ('S-P068', 'モルペコ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038138_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P069', 'ポケモンセンターのお姉さん', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038247_T_POKEMONSENTANOONEESAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P070', 'フクスロー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038248_P_FUKUSURO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P071', 'シャワーズ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038249_P_SHAWAZU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P072', 'ナックラー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038250_P_NAKKURA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P073', 'イトマル', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038251_P_ITOMARU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P074', 'ゾウドウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038252_P_ZOUDOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P075', 'イーブイ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038253_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P076', 'ヨクバリスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038254_P_YOKUBARISUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P077', 'ウカッツ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038255_T_UKATTSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P078', 'ヤロー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038256_T_YARO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P079', 'ムゲンダイナV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038257_P_MUGENDAINAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P080', 'ムゲンダイナVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038258_P_MUGENDAINAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P081', 'フーパ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038259_P_FUPA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P082', 'ガラル タチフサグマ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038260_P_GARARUTACHIFUSAGUMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P083', '基本悪エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038261_E_KIHONAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P084', 'フォクスライ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038262_P_FOKUSURAI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P085', 'エール団のしたっぱ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038133_T_ERUDANNOSHITAPPA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P086', 'マリィ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038134_T_MARII.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P087', 'グズマ&ハラ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038135_T_GUZUMAHARA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P088', 'シロナ&カトレア', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038136_T_SHIRONAKATOREA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P089', 'マオ&スイレン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038137_T_MAOSUIREN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P090', '基本草エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038263_E_KIHONKUSAENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P091', '基本炎エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038264_E_KIHONHONOOENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P092', '基本水エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038265_E_KIHONMIZUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P093', '基本雷エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038266_E_KIHONKAMINARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P094', '基本超エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038267_E_KIHONCHOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P095', '基本闘エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038268_E_KIHONTOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P096', '基本悪エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038269_E_KIHONAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P097', '基本鋼エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038270_E_KIHONKOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P098', '基本フェアリーエネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038271_E_KIHONFEARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P099', '名探偵ピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038272_P_MEITANTEIPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P100', 'イーブイ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038494_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P101', 'イーブイVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038495_P_IBUIVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P102', 'ジムトレーナー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038496_T_JIMUTORENA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P103', 'リザードンV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038497_P_RIZADONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P104', 'リザードンVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038498_P_RIZADONVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P105', 'まるのみされたピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039059_P_MARUNOMISARETAPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P106', 'ココ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039360_P_KOKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P107', 'モルペコ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038630_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P108', 'ザルードV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038493_P_ZARUDOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P109', 'イエッサン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038629_P_IESSAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P110', 'イオルブV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038608_P_IORUBUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P111', 'ブリムオンV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038609_P_BURIMUONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P112', 'ヒトカゲ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038610_P_HITOKAGE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P113', 'サシカマス', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038611_P_SASHIKAMASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P114', 'サンダース', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038612_P_SANDASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P115', 'ゴマゾウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038613_P_GOMAZOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P116', 'ワルビル', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038614_P_WARUBIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P117', 'イーブイ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038615_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P118', 'ソッドとシルディ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038616_T_SODDOTOSHIRUDEI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P119', 'ふくよかミュージシャン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038886_T_FUKUYOKAMYUJISHAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P120', 'ローズ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038617_T_ROZU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P121', 'ピカチュウV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038618_P_PIKACHUUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P122', 'ピカチュウV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038619_P_PIKACHUUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P123', 'ピカチュウVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038620_P_PIKACHUUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P124', 'ピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038621_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P125', 'ピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038622_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P126', 'ピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038623_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P127', 'プレイヤーズセレモニー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038633_T_PUREIYAZUSEREMONI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P128', '博士の研究（マグノリア博士）', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038634_T_HAKASENOKENKYUUMAGUNORIAHAKASE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P129', 'メッソン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038624_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P130', 'ヒバニー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038625_P_HIBANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P131', 'メッソン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038626_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P132', 'ピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038627_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P133', '基本水エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038628_E_KIHONMIZUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P135', 'ガラル ジグザグマ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038644_P_GARARUJIGUZAGUMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P136', 'げんきのハチマキ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038645_T_GENKINOHACHIMAKI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P137', 'モルペコ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038836_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P138', 'ビート', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038837_T_BITO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P139', 'ホップ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038838_T_HOPPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P140', 'マリィ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038839_T_MARII.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P141', 'ムウマージ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038631_P_MUUMAJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P142', 'ナツメ＆ハチク', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038632_T_NATSUMEHACHIKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P143', 'リザードン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038840_P_RIZADON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P144', 'カナザワのピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038841_P_KANAZAWANOPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P145', 'ミロカロス', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038842_P_MIROKAROSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P146', 'メッソン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038843_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P147', 'カナザワのピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038844_P_KANAZAWANOPIKACHUU.jpg', '0');

INSERT INTO pokemon_card VALUES ('S-P152', 'クロバットV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038908_P_KUROBATTOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P153', '基本悪エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038909_E_KIHONAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P154', 'ハイド悪エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038910_E_HAIDOAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P155', 'シロナ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039201_T_SHIRONA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P156', 'カビゴン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039246_P_KABIGON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P157', 'ミツバ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039202_T_MITSUBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P158', 'チェリンボ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039203_P_CHIERINBO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P159', 'ポカブ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039204_P_POKABU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P160', 'ガラル バリヤード', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039205_P_GARARUBARIYADO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P161', 'ブラッキー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039206_P_BURAKKI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P162', 'ドードリオV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039207_P_DODORIOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P163', 'イーブイ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039208_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P164', 'ミツバ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039209_T_MITSUBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P165', 'ダンデ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039210_T_DANDE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P166', 'アルセウス&ディアルガ&パルキアGX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038911_P_ARUSEUSUDEIARUGAPARUKIAGX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P167', 'プレシャスボール', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039060_T_PURESHASUBORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P168', 'エースバーンV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039211_P_ESUBANV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P169', 'エースバーンVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039343_P_ESUBANVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P170', 'ゴリランダーV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039212_P_GORIRANDAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P171', 'ゴリランダーVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039344_P_GORIRANDAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P172', 'ガラル ヤドン', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039345_P_GARARUYADON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P173', 'コオリッポ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039508_P_KOORIPPO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P174', 'サダイジャV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039509_P_SADAIJAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P175', 'セレビィV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039510_P_SEREBIIV.jpg', '0');

INSERT INTO pokemon_card VALUES ('S-P184', 'エンペルトV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039583_P_ENPERUTOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P185', 'バンギラスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039584_P_BANGIRASUV.jpg', '0');

INSERT INTO pokemon_card VALUES ('S-P190', 'ポットデス', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039339_P_POTTODESU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P191', 'ガラル バリコオル', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039340_P_GARARUBARIKOORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P192', 'デデンネ', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039341_P_DEDENNE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P193', 'ホルビー', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039342_P_HORUBI.jpg', '0');

-- SP4 8　VMAXスペシャルセット イーブイヒーローズ
INSERT INTO pokemon_card VALUES ('SP4001', 'ブースターVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039654_P_BUSUTAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4002', 'シャワーズVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039655_P_SHAWAZUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4003', 'サンダースVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039656_P_SANDASUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4004', 'エーフィVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039657_P_EFIVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4FIR', '基本炎エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039658_E_KIHONHONOOENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4LIG', '基本雷エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039660_E_KIHONKAMINARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4PSY', '基本超エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039661_E_KIHONCHOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4WAT', '基本水エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039659_E_KIHONMIZUENERUGI.jpg', '0');

-- S6a 69　強化拡張パック「イーブイヒーローズ」
INSERT INTO pokemon_card VALUES ('S6a001', 'カイロス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039585_P_KAIROSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a002', 'リーフィアV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039586_P_RIFIAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a003', 'リーフィアVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039587_P_RIFIAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a004', 'クルミル', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039588_P_KURUMIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a005', 'クルマユ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039589_P_KURUMAYU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a006', 'ハハコモリ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039590_P_HAHAKOMORI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a007', 'シズクモ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039591_P_SHIZUKUMO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a008', 'オニシズクモ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039592_P_ONISHIZUKUMO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a009', 'ヒメンカ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039593_P_HIMENKA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a010', 'ワタシラガ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039594_P_WATASHIRAGA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a011', 'ブースターV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039595_P_BUSUTAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a012', 'マグマッグ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039596_P_MAGUMAGGU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a013', 'マグカルゴ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039597_P_MAGUKARUGO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a014', 'エンテイ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039598_P_ENTEI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a015', 'シャワーズV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039599_P_SHAWAZUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a016', 'マリル', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039600_P_MARIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a017', 'マリルリ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039601_P_MARIRURI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a018', 'マンタイン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039602_P_MANTAIN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a019', 'ミズゴロウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039603_P_MIZUGOROU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a020', 'ヌマクロー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039604_P_NUMAKURO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a021', 'ラグラージ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039605_P_RAGURAJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a022', 'ヒンバス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039606_P_HINBASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a023', 'ミロカロス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039607_P_MIROKAROSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a024', 'グレイシアV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039608_P_GUREISHIAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a025', 'グレイシアVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039609_P_GUREISHIAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a026', 'ピカチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039610_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a027', 'ライチュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039611_P_RAICHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a028', 'ビリリダマ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039612_P_BIRIRIDAMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a029', 'マルマイン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039613_P_MARUMAIN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a030', 'サンダースV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039614_P_SANDASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a031', 'ロトム', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039615_P_ROTOMU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a032', 'シビシラス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039616_P_SHIBISHIRASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a033', 'シビビール', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039617_P_SHIBIBIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a034', 'シビルドン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039618_P_SHIBIRUDON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a035', 'エーフィＶ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039619_P_EFIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a036', 'クチート', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039620_P_KUCHITO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a037', 'フラベベ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039621_P_FURABEBE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a038', 'フラエッテ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039622_P_FURAETTE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a039', 'フラージェス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039623_P_FURAJIESU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a040', 'ニンフィアV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039624_P_NINFIAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a041', 'ニンフィアVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039625_P_NINFIAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a042', 'スナバァ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039626_P_SUNABAA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a043', 'シロデスナ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039627_P_SHIRODESUNA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a044', 'マーシャドー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039628_P_MASHADO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a045', 'イエッサン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039629_P_IESSAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a046', 'ヤンチャム', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039630_P_YANCHAMU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a047', 'ブラッキーV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039631_P_BURAKKIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a048', 'ブラッキーVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039632_P_BURAKKIVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a049', 'ゾロア', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039633_P_ZOROA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a050', 'ゾロアーク', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039634_P_ZOROAKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a051', 'ゴロンダ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039635_P_GORONDA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a052', 'ベロバー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039636_P_BEROBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a053', 'ギモー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039637_P_GIMO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a054', 'オーロンゲ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039638_P_ORONGE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a055', 'ニャース', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039639_P_NYASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a056', 'ペルシアン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039640_P_PERUSHIAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a057', 'ガルーラ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039641_P_GARURA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a058', 'イーブイ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039642_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a059', 'ドーブル', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039643_P_DOBURU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a060', 'ぐんぐんシェイク', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039644_T_GUNGUNSHIEIKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a061', 'ドリームボール', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039645_T_DORIMUBORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a062', 'エレメンタルバッジ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039646_T_EREMENTARUBAJJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a063', 'スノーリーフバッジ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039647_T_SUNORIFUBAJJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a064', '月と太陽のバッジ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039648_T_GATSUTOTAIYOUNOBAJJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a065', 'リボンバッジ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039649_T_RIBONBAJJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a066', 'アロマなおねえさん', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039650_T_AROMANAONEESAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a067', 'マクワ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039651_T_MAKUWA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a068', 'ファッションモール', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039652_T_FASSHONMORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a069', '特殊エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039653_E_TOREJAENERUGI.jpg', '0');

-- SGI 23 ハイクラスデッキ「インテレオンVMAX」
INSERT INTO pokemon_card VALUES ('SGI001', 'ラプラス', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039559_P_RAPURASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI002', 'テッポウオ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039560_P_TEPPOUO.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI003', 'オクタン', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039561_P_OKUTAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI004', 'バスラオ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039562_P_BASURAO.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI005', 'インテレオンV', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039563_P_INTEREONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI006', 'インテレオンVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039564_P_INTEREONVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI007', 'クロバットV', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039565_P_KUROBATTOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI008', 'ミミロル', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039566_P_MIMIRORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI009', 'ミミロップ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039567_P_MIMIROPPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI010', 'ルチャブル', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039568_P_RUCHABURU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI011', 'エネルギー回収', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039569_T_ENERUGIKAISHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI012', 'クイックボール', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039570_T_KUIKKUBORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI013', 'しんかのおこう', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039571_T_SHINKANOOKOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI014', 'ポケギア3.0', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039572_T_POKEGIA.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI015', 'ポケモンいれかえ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039573_T_POKEMONIREKAE.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI016', 'コルニの気合い', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039574_T_KORUNINOKIAI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI017', '博士の研究（アララギ博士）', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039575_T_HAKASENOKENKYUUARARAGIHAKASE.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI018', '冒険家の発見', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039576_T_BOUKENKANOHAKKEN.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI019', 'ボスの指令（フラダリ）', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039577_T_BOSUNOSHIREIFURADARI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI020', 'マリィ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039578_T_MARII.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI021', 'みずの塔', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039579_T_MIZUNOTOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI022', 'れんげきエネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039580_E_RENGEKIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGIWAT', '基本水エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039582_E_KIHONMIZUENERUGI.jpg', '0');

-- SGG 20 ハイクラスデッキ「ゲンガーVMAX」
INSERT INTO pokemon_card VALUES ('SGG001', 'ゲンガーV', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039538_P_GENGAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG002', 'ゲンガーVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039539_P_GENGAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG003', 'クロバットV', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039540_P_KUROBATTOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG004', 'デルビル', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039541_P_DERUBIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG005', 'ヘルガー', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039542_P_HERUGA.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG006', 'イベルタル', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039543_P_IBERUTARU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG007', 'モルペコ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039544_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG008', '活力の壺', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039545_T_KATSURYOKUNOTSUBO.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG009', 'クイックボール', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039546_T_KUIKKUBORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG010', 'しんかのおこう', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039547_T_SHINKANOOKOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG011', 'ポケギア3.0', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039548_T_POKEGIA.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG012', 'ポケモンいれかえ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039549_T_POKEMONIREKAE.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG013', 'シバ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039550_T_SHIBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG014', '博士の研究（アララギ博士）', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039551_T_HAKASENOKENKYUUARARAGIHAKASE.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG015', '冒険家の発見', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039552_T_BOUKENKANOHAKKEN.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG016', 'ボスの指令（フラダリ）', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039553_T_BOSUNOSHIREIFURADARI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG017', 'マリィ', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039554_T_MARII.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG018', 'あくの塔', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039555_T_AKUNOTOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG019', 'いちげきエネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039556_E_ICHIGEKIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGGDAR', '基本悪エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039558_E_KIHONAKUENERUGI.jpg', '0');

-- SP3 6 はくばバドレックスV
INSERT INTO pokemon_card VALUES ('SP3001', 'はくばバドレックスV', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039502_P_HAKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3002', 'こくばバドレックスV', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039503_P_KOKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3003', '妖しいカンヅメ', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039504_T_AYASHIIKANDUME.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3004', 'たっぷりバケツ', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039505_T_TAPPURIBAKETSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3005', 'ウォッシュ水エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039506_E_UOSSHUMIZUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3006', 'ホラー超エネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039507_E_HORACHOUENERUGI.jpg', '0');

-- S6K 83 拡張パック「漆黒のガイスト」
INSERT INTO pokemon_card VALUES ('S6K001', 'レディバ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039432_P_REDEIBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K002', 'レディアン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039433_P_REDEIAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K003', 'セレビィV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039434_P_SEREBIIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K004', 'セレビィVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039435_P_SEREBIIVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K005', 'タネボー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039436_P_TANEBO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K006', 'サルノリ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039437_P_SARUNORI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K007', 'バチンキー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039438_P_BACHINKI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K008', 'ゴリランダー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039439_P_GORIRANDA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K009', 'コダック', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039440_P_KODAKKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K010', 'ゴルダック', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039441_P_GORUDAKKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K011', 'ニューラ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039442_P_NYURA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K012', 'マニューラ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039443_P_MANYURA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K013', 'ポワルン あまみずのすがた', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039444_P_POWARUNAMAMIZUNOSUGATA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K014', 'ラブカス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039445_P_RABUKASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K015', 'オタマロ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039446_P_OTAMARO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K016', 'カプ・レヒレ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039447_P_KAPUREHIRE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K017', 'ウオチルドンV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039448_P_UOCHIRUDONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K018', 'メリープ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039449_P_MERIPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K019', 'モココ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039450_P_MOKOKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K020', 'デンリュウ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039451_P_DENRYUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K021', 'シママ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039452_P_SHIMAMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K022', 'ゼブライカ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039453_P_ZEBURAIKA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K023', 'エモンガ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039454_P_EMONGA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K024', 'ゼラオラV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039455_P_ZERAORAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K025', 'ゴース', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039456_P_GOSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K026', 'ゴースト', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039457_P_GOSUTO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K027', 'ゲンガー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039458_P_GENGA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K028', 'ヤミラミ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039459_P_YAMIRAMI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K029', 'クレセリア', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039460_P_KURESERIA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K030', 'ゴビット', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039461_P_GOBITTO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K031', 'ゴルーグ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039462_P_GORUGU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K032', 'マーイーカ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039463_P_MAIKA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K033', 'カラマネロ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039464_P_KARAMANERO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K034', 'アブリー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039465_P_ABURI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K035', 'アブリボン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039466_P_ABURIBON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K036', 'こくばバドレックスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039467_P_KOKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K037', 'こくばバドレックスVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039468_P_KOKUBABADOREKKUSUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K038', 'ガマガル', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039469_P_GAMAGARU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K039', 'ガマゲロゲ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039470_P_GAMAGEROGE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K040', 'マケンカニ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039471_P_MAKENKANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K041', 'ケケンカニ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039472_P_KEKENKANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K042', 'タタッコ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039473_P_TATAKKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K043', 'オトスパス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039474_P_OTOSUPASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K044', 'ドガース', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039475_P_DOGASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K045', 'マタドガス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039476_P_MATADOGASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K046', 'ガラル マタドガス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039477_P_GARARUMATADOGASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K047', 'コノハナ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039478_P_KONOHANA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K048', 'ダーテング', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039479_P_DATENGU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K049', 'メタグロスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039480_P_METAGUROSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K050', 'メタグロスVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039481_P_METAGUROSUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K051', 'コバルオン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039482_P_KOBARUON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K052', 'ハピナスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039483_P_HAPINASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K053', 'ポワルン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039484_P_POWARUN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K054', 'カクレオン', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039485_P_KAKUREON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K055', 'ヤヤコマ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039486_P_YAYAKOMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K056', 'ヒノヤコマ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039487_P_HINOYAKOMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K057', 'ファイアロー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039488_P_FAIARO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K058', 'ホシガリス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039489_P_HOSHIGARISU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K059', 'ヨクバリス', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039490_P_YOKUBARISU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K060', '霧の水晶', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039491_T_KIRINOSUISHOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K061', '草取りグローブ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039492_T_KUSATORIGUROBU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K062', '正義のグローブ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039493_T_SEIGINOGUROBU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K063', 'れんげきの巻物 天の巻', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039494_T_RENGEKINOMAKIMONOTENNOKAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K064', 'カトレア', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039495_T_KATOREA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K065', 'キクコ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039496_T_KIKUKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K066', 'シャクヤ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039497_T_SHAKUYA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K067', 'ズミ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039498_T_ZUMI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K068', 'いにしえの墓地', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039499_T_INISHIENOBOCHI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K069', 'スパイラルエネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039500_E_SUPAIRARUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K070', 'ラッキーエネルギー', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039501_E_RAKKIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K071', 'セレビィV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039512_P_SEREBIIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K072', 'ウオチルドンV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039513_P_UOCHIRUDONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K073', 'ゼラオラV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039514_P_ZERAORAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K074', 'ゼラオラV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039515_P_ZERAORAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K075', 'こくばバドレックスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039516_P_KOKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K076', 'こくばバドレックスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039517_P_KOKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K077', 'メタグロスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039518_P_METAGUROSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K078', 'ハピナスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039519_P_HAPINASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K079', 'ハピナスV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039520_P_HAPINASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K080', 'カトレア', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039521_T_KATOREA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K081', 'キクコ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039522_T_KIKUKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K082', 'シャクヤ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039523_T_SHAKUYA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K083', 'ズミ', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039524_T_ZUMI.jpg', '0');

-- S6H 83 拡張パック「白銀のランス

-- deck
INSERT INTO deck VALUES ('master', nextval('DECK_ID_SEQ'), 'ハイクラスデッキ インテレオンVMAX', '{{"SGI006", "インテレオンVMAX", "2"}, {"SGI005", "インテレオンV", "2"}, {"SGI007", "クロバットV", "1"}
, {"SGI003", "オクタン", "2"}, {"SGI002", "テッポウオ", "3"}, {"SGI004", "バスラオ", "1"}, {"SGI001", "ラプラス", "1"}, {"SGI009", "ミミロップ", "1"}, {"SGI008", "ミミロル", "2"}, {"SGI010", "ルチャブル", "1"}
, {"SGI012", "クイックボール", "4"}, {"SGI013", "しんかのおこう", "3"}, {"SGI014", "ポケギア3.0", "4"}, {"SGI011", "エネルギー回収", "1"}, {"SGI015", "ポケモンいれかえ", "2"}, {"SGI017", "博士の研究（アララギ博士）", "4"}
, {"SGI020", "マリィ", "4"}, {"SGI016", "コルニの気合い", "2"}, {"SGI018", "冒険家の発見", "1"}, {"SGI019", "ボスの指令（フラダリ）", "2"}, {"SGI021", "みずの塔", "2"}, {"SGI022", "れんげきエネルギー", "4"},{"SGIWAT", "基本水エネルギー", "11"}}');