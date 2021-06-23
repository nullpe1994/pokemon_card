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

-- S-P 171 �|�P�����J�[�h�Q�[���\�[�h&�V�[���h �v�����J�[�h
INSERT INTO pokemon_card VALUES ('S-P001', '�s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037601_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P002', '�V�u���̃s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037602_P_SHIBUYANOPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P003', '���b�N�E�U', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037603_P_REKKUUZA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P004', '�E�[���[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037610_P_URU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P005', '�z�b�v', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037604_T_HOPPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P006', '�q�o�j�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037605_P_HIBANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P007', '�T���m��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037606_P_SARUNORI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P008', '���b�\��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037607_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P009', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037764_E_KIHONKUSAENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P010', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037765_E_KIHONHONOOENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P011', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037766_E_KIHONMIZUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P012', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037767_E_KIHONKAMINARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P013', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037768_E_KIHONCHOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P014', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037769_E_KIHONTOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P015', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037770_E_KIHONAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P016', '��{�|�G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037771_E_KIHONKOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P017', '����������', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037772_T_KIZUGUSURI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P018', '�Ȃ�ł��Ȃ���', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037773_T_NANDEMONAOSHI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P019', '�����X�^�[�{�[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037774_T_MONSUTABORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P020', '�R�I���b�|V', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037775_P_KOORIPPOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P021', '�q�����J', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037776_P_HIMENKA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P022', '�G�[�X�o�[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037777_P_ESUBAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P023', '�}���^�C��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037778_P_MANTAIN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P024', '�s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037779_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P025', '�K���� �|�j�[�^', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037780_P_GARARUPONITA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P026', '�����m�Y�N', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037781_P_YORUNOZUKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P027', '�r�[�g', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037782_T_BITO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P028', '�j���[�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037608_P_NYASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P029', '�j���[�XVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037609_P_NYASUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P030', '�W�������h��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037783_P_JURARUDON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P031', '�Ƃ������Ă��傤', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037791_T_TOMODACHITECHOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P032', '�����y�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037792_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P033', '�o�`���E�jV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037793_P_BACHINUNIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P034', '�q�o�j�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037797_P_HIBANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P035', '�����y�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037884_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P036', '�~����DX�̃s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037989_P_KYUUJOTAIDXNOPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P037', '�_�C�I�E�h�EV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037990_P_DAIOUDOUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P038', '�u�[�X�^�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037991_P_BUSUTA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P039', '���N�V�I', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037992_P_RUKUSHIO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P040', '�|�b�g�f�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037993_P_POTTODESUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P041', '�~�u����', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037994_P_MIBURIMU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P042', '�^���h��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037995_P_TANDON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P043', '���u�N����', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037996_P_YABUKURON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P044', '�C�[�u�C', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037997_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P045', '�t���O���[�u', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037998_T_GYAKKYOUGUROBU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P046', '�\�j�A', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/037999_T_SONIA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P047', '�o�`���E�j', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038000_P_BACHINUNI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P048', '�X�g�����_�[V', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038001_P_SUTORINDAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P049', '�X�s�[�h���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038002_E_SUPIDOKAMINARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P050', '���b�\��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038003_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P051', '����������', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038004_T_KIZUGUSURI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P052', '�ӂ����ȃA��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038005_T_FUSHIGINAAME.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P053', '�|�P�������ꂩ��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038006_T_POKEMONIREKAE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P054', '�����X�^�[�{�[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038007_T_MONSUTABORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P055', '���񂫂̃n�`�}�L', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038008_T_GENKINOHACHIMAKI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P056', '�r�[�g', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038009_T_BITO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P057', '�|�P����������', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038010_T_POKEMONGOKKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P058', '�z�b�v', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038011_T_HOPPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P059', '�C�G�b�T��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038643_P_IESSANV.jpg', '0');

INSERT INTO pokemon_card VALUES ('S-P068', '�����y�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038138_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P069', '�|�P�����Z���^�[�̂��o����', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038247_T_POKEMONSENTANOONEESAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P070', '�t�N�X���[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038248_P_FUKUSURO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P071', '�V�����[�Y', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038249_P_SHAWAZU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P072', '�i�b�N���[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038250_P_NAKKURA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P073', '�C�g�}��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038251_P_ITOMARU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P074', '�]�E�h�E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038252_P_ZOUDOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P075', '�C�[�u�C', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038253_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P076', '���N�o���XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038254_P_YOKUBARISUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P077', '�E�J�b�c', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038255_T_UKATTSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P078', '�����[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038256_T_YARO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P079', '���Q���_�C�iV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038257_P_MUGENDAINAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P080', '���Q���_�C�iVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038258_P_MUGENDAINAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P081', '�t�[�p', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038259_P_FUPA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P082', '�K���� �^�`�t�T�O�}', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038260_P_GARARUTACHIFUSAGUMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P083', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038261_E_KIHONAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P084', '�t�H�N�X���C', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038262_P_FOKUSURAI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P085', '�G�[���c�̂�������', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038133_T_ERUDANNOSHITAPPA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P086', '�}���B', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038134_T_MARII.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P087', '�O�Y�}&�n��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038135_T_GUZUMAHARA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P088', '�V���i&�J�g���A', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038136_T_SHIRONAKATOREA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P089', '�}�I&�X�C����', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038137_T_MAOSUIREN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P090', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038263_E_KIHONKUSAENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P091', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038264_E_KIHONHONOOENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P092', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038265_E_KIHONMIZUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P093', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038266_E_KIHONKAMINARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P094', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038267_E_KIHONCHOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P095', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038268_E_KIHONTOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P096', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038269_E_KIHONAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P097', '��{�|�G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038270_E_KIHONKOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P098', '��{�t�F�A���[�G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038271_E_KIHONFEARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P099', '���T��s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038272_P_MEITANTEIPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P100', '�C�[�u�C', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038494_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P101', '�C�[�u�CVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038495_P_IBUIVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P102', '�W���g���[�i�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038496_T_JIMUTORENA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P103', '���U�[�h��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038497_P_RIZADONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P104', '���U�[�h��VMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038498_P_RIZADONVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P105', '�܂�݂̂��ꂽ�s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039059_P_MARUNOMISARETAPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P106', '�R�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039360_P_KOKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P107', '�����y�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038630_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P108', '�U���[�hV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038493_P_ZARUDOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P109', '�C�G�b�T��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038629_P_IESSAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P110', '�C�I���uV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038608_P_IORUBUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P111', '�u�����I��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038609_P_BURIMUONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P112', '�q�g�J�Q', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038610_P_HITOKAGE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P113', '�T�V�J�}�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038611_P_SASHIKAMASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P114', '�T���_�[�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038612_P_SANDASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P115', '�S�}�]�E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038613_P_GOMAZOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P116', '�����r��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038614_P_WARUBIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P117', '�C�[�u�C', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038615_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P118', '�\�b�h�ƃV���f�B', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038616_T_SODDOTOSHIRUDEI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P119', '�ӂ��悩�~���[�W�V����', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038886_T_FUKUYOKAMYUJISHAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P120', '���[�Y', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038617_T_ROZU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P121', '�s�J�`���EV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038618_P_PIKACHUUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P122', '�s�J�`���EV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038619_P_PIKACHUUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P123', '�s�J�`���EVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038620_P_PIKACHUUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P124', '�s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038621_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P125', '�s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038622_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P126', '�s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038623_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P127', '�v���C���[�Y�Z�����j�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038633_T_PUREIYAZUSEREMONI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P128', '���m�̌����i�}�O�m���A���m�j', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038634_T_HAKASENOKENKYUUMAGUNORIAHAKASE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P129', '���b�\��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038624_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P130', '�q�o�j�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038625_P_HIBANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P131', '���b�\��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038626_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P132', '�s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038627_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P133', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038628_E_KIHONMIZUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P135', '�K���� �W�O�U�O�}', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038644_P_GARARUJIGUZAGUMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P136', '���񂫂̃n�`�}�L', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038645_T_GENKINOHACHIMAKI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P137', '�����y�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038836_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P138', '�r�[�g', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038837_T_BITO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P139', '�z�b�v', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038838_T_HOPPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P140', '�}���B', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038839_T_MARII.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P141', '���E�}�[�W', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038631_P_MUUMAJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P142', '�i�c�����n�`�N', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038632_T_NATSUMEHACHIKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P143', '���U�[�h��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038840_P_RIZADON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P144', '�J�i�U���̃s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038841_P_KANAZAWANOPIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P145', '�~���J���X', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038842_P_MIROKAROSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P146', '���b�\��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038843_P_MESSON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P147', '�J�i�U���̃s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038844_P_KANAZAWANOPIKACHUU.jpg', '0');

INSERT INTO pokemon_card VALUES ('S-P152', '�N���o�b�gV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038908_P_KUROBATTOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P153', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038909_E_KIHONAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P154', '�n�C�h���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038910_E_HAIDOAKUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P155', '�V���i', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039201_T_SHIRONA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P156', '�J�r�S��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039246_P_KABIGON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P157', '�~�c�o', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039202_T_MITSUBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P158', '�`�F�����{', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039203_P_CHIERINBO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P159', '�|�J�u', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039204_P_POKABU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P160', '�K���� �o�����[�h', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039205_P_GARARUBARIYADO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P161', '�u���b�L�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039206_P_BURAKKI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P162', '�h�[�h���IV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039207_P_DODORIOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P163', '�C�[�u�C', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039208_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P164', '�~�c�o', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039209_T_MITSUBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P165', '�_���f', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039210_T_DANDE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P166', '�A���Z�E�X&�f�B�A���K&�p���L�AGX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/038911_P_ARUSEUSUDEIARUGAPARUKIAGX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P167', '�v���V���X�{�[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039060_T_PURESHASUBORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P168', '�G�[�X�o�[��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039211_P_ESUBANV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P169', '�G�[�X�o�[��VMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039343_P_ESUBANVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P170', '�S�������_�[V', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039212_P_GORIRANDAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P171', '�S�������_�[VMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039344_P_GORIRANDAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P172', '�K���� ���h��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039345_P_GARARUYADON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P173', '�R�I���b�|', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039508_P_KOORIPPO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P174', '�T�_�C�W��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039509_P_SADAIJAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P175', '�Z���r�BV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039510_P_SEREBIIV.jpg', '0');

INSERT INTO pokemon_card VALUES ('S-P184', '�G���y���gV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039583_P_ENPERUTOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P185', '�o���M���XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039584_P_BANGIRASUV.jpg', '0');

INSERT INTO pokemon_card VALUES ('S-P190', '�|�b�g�f�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039339_P_POTTODESU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P191', '�K���� �o���R�I��', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039340_P_GARARUBARIKOORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P192', '�f�f���l', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039341_P_DEDENNE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S-P193', '�z���r�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S-P/039342_P_HORUBI.jpg', '0');

-- SP4 8�@VMAX�X�y�V�����Z�b�g �C�[�u�C�q�[���[�Y
INSERT INTO pokemon_card VALUES ('SP4001', '�u�[�X�^�[VMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039654_P_BUSUTAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4002', '�V�����[�YVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039655_P_SHAWAZUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4003', '�T���_�[�XVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039656_P_SANDASUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4004', '�G�[�t�BVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039657_P_EFIVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4FIR', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039658_E_KIHONHONOOENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4LIG', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039660_E_KIHONKAMINARIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4PSY', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039661_E_KIHONCHOUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP4WAT', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SP4/039659_E_KIHONMIZUENERUGI.jpg', '0');

-- S6a 69�@�����g���p�b�N�u�C�[�u�C�q�[���[�Y�v
INSERT INTO pokemon_card VALUES ('S6a001', '�J�C���X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039585_P_KAIROSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a002', '���[�t�B�AV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039586_P_RIFIAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a003', '���[�t�B�AVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039587_P_RIFIAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a004', '�N���~��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039588_P_KURUMIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a005', '�N���}��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039589_P_KURUMAYU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a006', '�n�n�R����', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039590_P_HAHAKOMORI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a007', '�V�Y�N��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039591_P_SHIZUKUMO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a008', '�I�j�V�Y�N��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039592_P_ONISHIZUKUMO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a009', '�q�����J', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039593_P_HIMENKA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a010', '���^�V���K', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039594_P_WATASHIRAGA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a011', '�u�[�X�^�[V', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039595_P_BUSUTAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a012', '�}�O�}�b�O', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039596_P_MAGUMAGGU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a013', '�}�O�J���S', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039597_P_MAGUKARUGO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a014', '�G���e�C', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039598_P_ENTEI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a015', '�V�����[�YV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039599_P_SHAWAZUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a016', '�}����', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039600_P_MARIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a017', '�}������', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039601_P_MARIRURI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a018', '�}���^�C��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039602_P_MANTAIN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a019', '�~�Y�S���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039603_P_MIZUGOROU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a020', '�k�}�N���[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039604_P_NUMAKURO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a021', '���O���[�W', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039605_P_RAGURAJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a022', '�q���o�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039606_P_HINBASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a023', '�~���J���X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039607_P_MIROKAROSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a024', '�O���C�V�AV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039608_P_GUREISHIAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a025', '�O���C�V�AVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039609_P_GUREISHIAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a026', '�s�J�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039610_P_PIKACHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a027', '���C�`���E', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039611_P_RAICHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a028', '�r�����_�}', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039612_P_BIRIRIDAMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a029', '�}���}�C��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039613_P_MARUMAIN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a030', '�T���_�[�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039614_P_SANDASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a031', '���g��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039615_P_ROTOMU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a032', '�V�r�V���X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039616_P_SHIBISHIRASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a033', '�V�r�r�[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039617_P_SHIBIBIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a034', '�V�r���h��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039618_P_SHIBIRUDON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a035', '�G�[�t�B�u', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039619_P_EFIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a036', '�N�`�[�g', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039620_P_KUCHITO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a037', '�t���x�x', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039621_P_FURABEBE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a038', '�t���G�b�e', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039622_P_FURAETTE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a039', '�t���[�W�F�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039623_P_FURAJIESU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a040', '�j���t�B�AV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039624_P_NINFIAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a041', '�j���t�B�AVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039625_P_NINFIAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a042', '�X�i�o�@', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039626_P_SUNABAA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a043', '�V���f�X�i', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039627_P_SHIRODESUNA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a044', '�}�[�V���h�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039628_P_MASHADO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a045', '�C�G�b�T��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039629_P_IESSAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a046', '�����`����', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039630_P_YANCHAMU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a047', '�u���b�L�[V', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039631_P_BURAKKIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a048', '�u���b�L�[VMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039632_P_BURAKKIVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a049', '�]���A', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039633_P_ZOROA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a050', '�]���A�[�N', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039634_P_ZOROAKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a051', '�S�����_', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039635_P_GORONDA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a052', '�x���o�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039636_P_BEROBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a053', '�M���[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039637_P_GIMO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a054', '�I�[�����Q', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039638_P_ORONGE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a055', '�j���[�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039639_P_NYASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a056', '�y���V�A��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039640_P_PERUSHIAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a057', '�K���[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039641_P_GARURA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a058', '�C�[�u�C', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039642_P_IBUI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a059', '�h�[�u��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039643_P_DOBURU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a060', '���񂮂�V�F�C�N', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039644_T_GUNGUNSHIEIKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a061', '�h���[���{�[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039645_T_DORIMUBORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a062', '�G�������^���o�b�W', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039646_T_EREMENTARUBAJJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a063', '�X�m�[���[�t�o�b�W', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039647_T_SUNORIFUBAJJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a064', '���Ƒ��z�̃o�b�W', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039648_T_GATSUTOTAIYOUNOBAJJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a065', '���{���o�b�W', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039649_T_RIBONBAJJI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a066', '�A���}�Ȃ��˂�����', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039650_T_AROMANAONEESAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a067', '�}�N��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039651_T_MAKUWA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a068', '�t�@�b�V�������[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039652_T_FASSHONMORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6a069', '����G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6a/039653_E_TOREJAENERUGI.jpg', '0');

-- SGI 23 �n�C�N���X�f�b�L�u�C���e���I��VMAX�v
INSERT INTO pokemon_card VALUES ('SGI001', '���v���X', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039559_P_RAPURASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI002', '�e�b�|�E�I', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039560_P_TEPPOUO.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI003', '�I�N�^��', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039561_P_OKUTAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI004', '�o�X���I', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039562_P_BASURAO.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI005', '�C���e���I��V', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039563_P_INTEREONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI006', '�C���e���I��VMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039564_P_INTEREONVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI007', '�N���o�b�gV', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039565_P_KUROBATTOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI008', '�~�~����', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039566_P_MIMIRORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI009', '�~�~���b�v', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039567_P_MIMIROPPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI010', '���`���u��', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039568_P_RUCHABURU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI011', '�G�l���M�[���', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039569_T_ENERUGIKAISHUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI012', '�N�C�b�N�{�[��', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039570_T_KUIKKUBORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI013', '���񂩂̂�����', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039571_T_SHINKANOOKOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI014', '�|�P�M�A3.0', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039572_T_POKEGIA.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI015', '�|�P�������ꂩ��', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039573_T_POKEMONIREKAE.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI016', '�R���j�̋C����', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039574_T_KORUNINOKIAI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI017', '���m�̌����i�A�����M���m�j', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039575_T_HAKASENOKENKYUUARARAGIHAKASE.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI018', '�`���Ƃ̔���', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039576_T_BOUKENKANOHAKKEN.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI019', '�{�X�̎w�߁i�t���_���j', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039577_T_BOSUNOSHIREIFURADARI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI020', '�}���B', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039578_T_MARII.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI021', '�݂��̓�', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039579_T_MIZUNOTOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGI022', '��񂰂��G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039580_E_RENGEKIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGIWAT', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SGI/039582_E_KIHONMIZUENERUGI.jpg', '0');

-- SGG 20 �n�C�N���X�f�b�L�u�Q���K�[VMAX�v
INSERT INTO pokemon_card VALUES ('SGG001', '�Q���K�[V', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039538_P_GENGAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG002', '�Q���K�[VMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039539_P_GENGAVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG003', '�N���o�b�gV', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039540_P_KUROBATTOV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG004', '�f���r��', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039541_P_DERUBIRU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG005', '�w���K�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039542_P_HERUGA.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG006', '�C�x���^��', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039543_P_IBERUTARU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG007', '�����y�R', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039544_P_MORUPEKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG008', '���͂̚�', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039545_T_KATSURYOKUNOTSUBO.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG009', '�N�C�b�N�{�[��', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039546_T_KUIKKUBORU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG010', '���񂩂̂�����', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039547_T_SHINKANOOKOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG011', '�|�P�M�A3.0', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039548_T_POKEGIA.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG012', '�|�P�������ꂩ��', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039549_T_POKEMONIREKAE.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG013', '�V�o', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039550_T_SHIBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG014', '���m�̌����i�A�����M���m�j', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039551_T_HAKASENOKENKYUUARARAGIHAKASE.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG015', '�`���Ƃ̔���', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039552_T_BOUKENKANOHAKKEN.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG016', '�{�X�̎w�߁i�t���_���j', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039553_T_BOSUNOSHIREIFURADARI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG017', '�}���B', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039554_T_MARII.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG018', '�����̓�', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039555_T_AKUNOTOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGG019', '���������G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039556_E_ICHIGEKIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SGGDAR', '��{���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SGG/039558_E_KIHONAKUENERUGI.jpg', '0');

-- SP3 6 �͂��΃o�h���b�N�XV
INSERT INTO pokemon_card VALUES ('SP3001', '�͂��΃o�h���b�N�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039502_P_HAKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3002', '�����΃o�h���b�N�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039503_P_KOKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3003', '�d�����J���d��', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039504_T_AYASHIIKANDUME.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3004', '�����Ղ�o�P�c', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039505_T_TAPPURIBAKETSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3005', '�E�H�b�V�����G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039506_E_UOSSHUMIZUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('SP3006', '�z���[���G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/SP3/039507_E_HORACHOUENERUGI.jpg', '0');

-- S6K 83 �g���p�b�N�u�����̃K�C�X�g�v
INSERT INTO pokemon_card VALUES ('S6K001', '���f�B�o', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039432_P_REDEIBA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K002', '���f�B�A��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039433_P_REDEIAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K003', '�Z���r�BV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039434_P_SEREBIIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K004', '�Z���r�BVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039435_P_SEREBIIVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K005', '�^�l�{�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039436_P_TANEBO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K006', '�T���m��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039437_P_SARUNORI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K007', '�o�`���L�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039438_P_BACHINKI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K008', '�S�������_�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039439_P_GORIRANDA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K009', '�R�_�b�N', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039440_P_KODAKKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K010', '�S���_�b�N', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039441_P_GORUDAKKU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K011', '�j���[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039442_P_NYURA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K012', '�}�j���[��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039443_P_MANYURA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K013', '�|������ ���܂݂��̂�����', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039444_P_POWARUNAMAMIZUNOSUGATA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K014', '���u�J�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039445_P_RABUKASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K015', '�I�^�}��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039446_P_OTAMARO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K016', '�J�v�E���q��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039447_P_KAPUREHIRE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K017', '�E�I�`���h��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039448_P_UOCHIRUDONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K018', '�����[�v', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039449_P_MERIPU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K019', '���R�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039450_P_MOKOKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K020', '�f�������E', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039451_P_DENRYUU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K021', '�V�}�}', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039452_P_SHIMAMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K022', '�[�u���C�J', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039453_P_ZEBURAIKA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K023', '�G�����K', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039454_P_EMONGA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K024', '�[���I��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039455_P_ZERAORAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K025', '�S�[�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039456_P_GOSU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K026', '�S�[�X�g', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039457_P_GOSUTO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K027', '�Q���K�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039458_P_GENGA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K028', '���~���~', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039459_P_YAMIRAMI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K029', '�N���Z���A', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039460_P_KURESERIA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K030', '�S�r�b�g', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039461_P_GOBITTO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K031', '�S���[�O', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039462_P_GORUGU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K032', '�}�[�C�[�J', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039463_P_MAIKA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K033', '�J���}�l��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039464_P_KARAMANERO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K034', '�A�u���[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039465_P_ABURI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K035', '�A�u���{��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039466_P_ABURIBON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K036', '�����΃o�h���b�N�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039467_P_KOKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K037', '�����΃o�h���b�N�XVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039468_P_KOKUBABADOREKKUSUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K038', '�K�}�K��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039469_P_GAMAGARU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K039', '�K�}�Q���Q', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039470_P_GAMAGEROGE.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K040', '�}�P���J�j', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039471_P_MAKENKANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K041', '�P�P���J�j', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039472_P_KEKENKANI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K042', '�^�^�b�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039473_P_TATAKKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K043', '�I�g�X�p�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039474_P_OTOSUPASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K044', '�h�K�[�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039475_P_DOGASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K045', '�}�^�h�K�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039476_P_MATADOGASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K046', '�K���� �}�^�h�K�X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039477_P_GARARUMATADOGASU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K047', '�R�m�n�i', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039478_P_KONOHANA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K048', '�_�[�e���O', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039479_P_DATENGU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K049', '���^�O���XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039480_P_METAGUROSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K050', '���^�O���XVMAX', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039481_P_METAGUROSUVMAX.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K051', '�R�o���I��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039482_P_KOBARUON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K052', '�n�s�i�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039483_P_HAPINASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K053', '�|������', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039484_P_POWARUN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K054', '�J�N���I��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039485_P_KAKUREON.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K055', '�����R�}', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039486_P_YAYAKOMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K056', '�q�m���R�}', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039487_P_HINOYAKOMA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K057', '�t�@�C�A���[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039488_P_FAIARO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K058', '�z�V�K���X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039489_P_HOSHIGARISU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K059', '���N�o���X', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039490_P_YOKUBARISU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K060', '���̐���', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039491_T_KIRINOSUISHOU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K061', '�����O���[�u', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039492_T_KUSATORIGUROBU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K062', '���`�̃O���[�u', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039493_T_SEIGINOGUROBU.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K063', '��񂰂��̊��� �V�̊�', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039494_T_RENGEKINOMAKIMONOTENNOKAN.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K064', '�J�g���A', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039495_T_KATOREA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K065', '�L�N�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039496_T_KIKUKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K066', '�V���N��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039497_T_SHAKUYA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K067', '�Y�~', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039498_T_ZUMI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K068', '���ɂ����̕�n', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039499_T_INISHIENOBOCHI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K069', '�X�p�C�����G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039500_E_SUPAIRARUENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K070', '���b�L�[�G�l���M�[', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039501_E_RAKKIENERUGI.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K071', '�Z���r�BV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039512_P_SEREBIIV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K072', '�E�I�`���h��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039513_P_UOCHIRUDONV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K073', '�[���I��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039514_P_ZERAORAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K074', '�[���I��V', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039515_P_ZERAORAV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K075', '�����΃o�h���b�N�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039516_P_KOKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K076', '�����΃o�h���b�N�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039517_P_KOKUBABADOREKKUSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K077', '���^�O���XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039518_P_METAGUROSUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K078', '�n�s�i�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039519_P_HAPINASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K079', '�n�s�i�XV', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039520_P_HAPINASUV.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K080', '�J�g���A', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039521_T_KATOREA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K081', '�L�N�R', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039522_T_KIKUKO.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K082', '�V���N��', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039523_T_SHAKUYA.jpg', '0');
INSERT INTO pokemon_card VALUES ('S6K083', '�Y�~', 'https://www.pokemon-card.com/assets/images/card_images/large/S6K/039524_T_ZUMI.jpg', '0');

-- S6H 83 �g���p�b�N�u����̃����X

-- deck
INSERT INTO deck VALUES ('master', nextval('DECK_ID_SEQ'), '�n�C�N���X�f�b�L �C���e���I��VMAX', '{{"SGI006", "�C���e���I��VMAX", "2"}, {"SGI005", "�C���e���I��V", "2"}, {"SGI007", "�N���o�b�gV", "1"}
, {"SGI003", "�I�N�^��", "2"}, {"SGI002", "�e�b�|�E�I", "3"}, {"SGI004", "�o�X���I", "1"}, {"SGI001", "���v���X", "1"}, {"SGI009", "�~�~���b�v", "1"}, {"SGI008", "�~�~����", "2"}, {"SGI010", "���`���u��", "1"}
, {"SGI012", "�N�C�b�N�{�[��", "4"}, {"SGI013", "���񂩂̂�����", "3"}, {"SGI014", "�|�P�M�A3.0", "4"}, {"SGI011", "�G�l���M�[���", "1"}, {"SGI015", "�|�P�������ꂩ��", "2"}, {"SGI017", "���m�̌����i�A�����M���m�j", "4"}
, {"SGI020", "�}���B", "4"}, {"SGI016", "�R���j�̋C����", "2"}, {"SGI018", "�`���Ƃ̔���", "1"}, {"SGI019", "�{�X�̎w�߁i�t���_���j", "2"}, {"SGI021", "�݂��̓�", "2"}, {"SGI022", "��񂰂��G�l���M�[", "4"},{"SGIWAT", "��{���G�l���M�[", "11"}}');