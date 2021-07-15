import React,{ useEffect, useState, useContext, useCallback } from 'react';
import {useRecoilState, useSetRecoilState, useRecoilValue} from 'recoil';
import Menu from '@material-ui/core/Menu';
import MenuItem from '@material-ui/core/MenuItem';
import HandsState from '../State/handsState';
import battleFieldState from '../State/battleFieldState';
import trashState from '../State/trashState';
import requireCostState from '../State/requireCostState';
import howManyState from '../State/howManyState';
import contentTextState from '../State/contentTextState';
import UserNameContext from '../Context/UserNameContext';
import galleryState from '../State/galleryState';
import handOfIndexState from '../State/handOfIndexState';
import searchSortState from '../State/searchSortState';
import cardNameState from '../State/cardNameState';

const CardComands = (props) => {
    const [superTypeButtonText, setSuperTypeButtonText] = useState('');
    const [tcgFunction, setTcgFunction] = useState('');
    const [hands, setHands] = useRecoilState(HandsState);
    const setTrash = useSetRecoilState(trashState);
    const battleField = useRecoilValue(battleFieldState);
	const setContentText = useSetRecoilState(contentTextState);
    const setHowMany = useSetRecoilState(howManyState);
    const setRequireCost = useSetRecoilState(requireCostState);
    const setGallery = useSetRecoilState(galleryState);
    const setHandOfIndex = useSetRecoilState(handOfIndexState);
    const setCardName = useSetRecoilState(cardNameState);
    const setSearchSort = useSetRecoilState(searchSortState);
    const userName = useContext(UserNameContext);

    
    const cardComandsFunc = useCallback(() => {
        let newHands = [...hands];
        // 削除予定関数
        const updateHands = (index) => {
            return new Promise(resolve => {
                setTimeout(() => {
                    newHands.splice(index, 1);
                    setHands(newHands);
                    resolve();
                },);
            });
        }
        
        const callToBattleField = async (index) => {
            window.socket.emit('callToBattleField', { 
                yourId: userName.yourId, 
                oppId: userName.oppId,
                index: index
            });
            props.handleClose();
        }
    
        const callToBench = async (index) => {
            window.socket.emit('callToBench', {
                yourId: userName.yourId, 
                oppId: userName.oppId,
                index: index
            });
            props.handleClose();
        }
    
        const useSpellCard = async (index) => {
            let newYourHands = [...newHands];
            switch(props.cardName) {
                case 'クイックボール':
                    newYourHands.splice(index, 1);
                    setGallery(newYourHands);
                    setContentText('トラッシュするカードを1枚選んでください');
                    setHowMany(1);
                    setRequireCost(true);
                    setHandOfIndex(index);
                    setCardName(props.cardName);
                    break;
                case 'ポケモン通信':
                    newYourHands.splice(index, 1);
                    setGallery(newYourHands);
                    setContentText('デッキに戻すポケモンを1枚選んでください');
                    setHowMany(1);
                    setRequireCost(true);
                    setHandOfIndex(index);
                    setCardName(props.cardName);
                    setSearchSort(1);
                    break;
                default :
                    window.socket.emit('useSpellCard', {
                        yourId: userName.yourId,
                        oppId: userName.oppId,
                        index: index
                    });
            }
            props.handleClose();
        }
    
        const useEnergyCard = async (index) => {
            const newCard = newHands[index];
            setTrash((prev) => [...prev, newCard]);
            props.handleClose();
            await updateHands(index);
        }

        switch (props.supertype) {
            case 0:
                setSuperTypeButtonText('ポケモンにつける');
                setTcgFunction(() => useEnergyCard);
                break;
            case 1:
                if (battleField.length === 0) {
                    setSuperTypeButtonText('バトル場に出す');
                    setTcgFunction(() => callToBattleField);
                    break;
                } else {
                    setSuperTypeButtonText('ベンチに出す');
                    setTcgFunction(() => callToBench);
                    break;
                }
            case 2:
                setSuperTypeButtonText('使用する');
                setTcgFunction(() => useSpellCard);
                break;
            default:
                console.log('nothing');
        }

    },[
        battleField.length, setContentText, setGallery, 
        props, setHandOfIndex, setHowMany, 
        setTrash, setRequireCost, setHands, 
        userName.oppId, userName.yourId, hands,
        setCardName, setSearchSort
    ]);

    useEffect(() => {
        cardComandsFunc();
    },[cardComandsFunc]);

    return(
        <Menu
            id="simple-menu"
            anchorEl={props.anchorEl}
            keepMounted
            open={Boolean(props.anchorEl)}
            onClose={props.handleClose}
        >
            {/* 関数ごとにボタンの表示や非表示を実装する予定 */}
            <MenuItem onClick={() => tcgFunction(props.index)}>{superTypeButtonText}</MenuItem>
        </Menu>
    );
}

export default CardComands;