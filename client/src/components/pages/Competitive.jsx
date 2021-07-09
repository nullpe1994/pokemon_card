import React, { useEffect, useState } from 'react';
import jirachi from '../../image/jirachiWallPaper.jpg'
import { Box, Divider } from '@material-ui/core';
import OpponentField from '../organisms/OpponentField';
import YourField from '../organisms/YourField';
import DrawACard from '../function/DrawACard';
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import ShuffleTheDeck from '../function/ShuffleTheDeck';
import {useRecoilState, useRecoilValue, useSetRecoilState} from 'recoil';
import yourHandState from '../State/yourHandState';
import yourSideCardsState from '../State/yourSideCardsState';
import phaseState from '../State/phaseState';
import battleFieldState from '../State/battleFieldState';
import offTurnDisplayState from '../State/offTurnDisplayState';
import deckState from '../State/deckState';
import UserNameContext from '../Context/UserNameContext';
import oppDeckState from '../State/oppDeckState';
import oppBattleFieldState from '../State/oppBattleFieldState';

const Competitive = (props) => {
    const [deck, setDeck] = useRecoilState(deckState);
    const [yourHand, setYourHand] = useRecoilState(yourHandState);
    const setYourSideCards = useSetRecoilState(yourSideCardsState);
    const [phase, setPhase] = useRecoilState(phaseState);
    const battleField = useRecoilValue(battleFieldState);
    const setOffTurnDisplay = useSetRecoilState(offTurnDisplayState);
    const [noBasic, setNoBasic] = useState(false);
    const userName = {
        yourId: props.location.state.yourId, 
        oppId: props.location.state.oppId
    }
    const setOppDeck = useSetRecoilState(oppDeckState);
    const setOppBattleField = useSetRecoilState(oppBattleFieldState);
    
    // socket通信実装時に修正
    useEffect(() => {
        async function fetchDate() {
            if (phase === 0) {
                setPhase(0);
                if (battleField.length !== 0) {
                    for (let i=0; i<6; i++) {
                        await SetSideCards();
                    }
                    setPhase(prev => prev+1);
                }
            } else if (phase === 1) {
                await Draw();
                console.log('draw');
                setPhase(prev => prev+1);
            } else if (phase === 2) {
                console.log('done draw, now your turn')
            }
        }
        fetchDate();
    },[phase, battleField]);
    
    const Mulligan = async () => {
        setNoBasic(false);
        let basicCnt = 0;
        yourHand.map(card => {
            deck.cards.push(card);
        });
        setYourHand([]);
        for (let i=0; i<7; i++) ShuffleTheDeck(deck.cards);

        for (let i=0; i<7; i++) {
            let card = [];
            card = await Draw();
            card.subtypes.filter((subtype) => {
                if (subtype === 2) {
                    basicCnt++;
                }
            }); 
        }

        if (basicCnt === 0) setNoBasic((prev) => !prev);
        else setNoBasic(false);
    }
    
    const SetSideCards = () => {
        return new Promise(resolve => {
            setTimeout(() => {
                window.socket.emit('setSideCard', { yourId: userName.yourId});
                update();
                resolve();
            },300);
        });
    }

    const Draw = () => {
        return new Promise(resolve => {
            setTimeout(() => {
                // setDeck(DrawACard(userName.yourId));
                window.socket.emit('draw', { yourId: userName.yourId });
                update();
                resolve();
            },300);
        });
    }
    
    const chooseYourOrder = async () => {
        setOffTurnDisplay(false);
        let basicCnt = 0;
        window.socket.emit('shuffleTheDeck', { yourId: userName.yourId });
        for (let i=0; i<7; i++) {
            await Draw();
        }
        if (basicCnt === 0) setNoBasic((prev) => !prev);
        else setNoBasic(false);
    }

    const update = () => {
        window.socket.emit('deck', { yourId: userName.yourId });
        window.socket.on('getDeck', (res) => {
            setDeck(res.deckSize);
        });

        window.socket.emit('oppDeck', { oppId: userName.oppId});
        window.socket.on('getOppDeck', (res) => {
            setOppDeck(res.deckSize);
        });

        window.socket.emit('hand', { yourId: userName.yourId });
        window.socket.on('getHand', (res) => {
            setYourHand(res.hand);
        });

        window.socket.emit('sideCard', { yourId: userName.yourId });
        window.socket.on('getSideCard', (res) => {
            setYourSideCards(res.sideCard); 
        });
        
        window.socket.emit('oppBattleField', { oppId: userName.oppId});
        window.socket.on('getOppBattleField', (res) => {
            setOppBattleField(res.battleField);
        });
    }

    return (
        <Box style={{
            backgroundImage: `url(${jirachi})`,
            backgroundSize: 'cover',
            }}
            p={{md: 5}}
        >
            <OpponentField/>
            <Divider/>
            <UserNameContext.Provider value={userName}>
                <YourField 
                    chooseYourOrder={chooseYourOrder}
                    deck = {deck}
                />
            </UserNameContext.Provider>
            {/* <Dialog
                open={noBasic}
                aria-labelledby="alert-dialog-title"
                aria-describedby="alert-dialog-description"
            >
                <DialogTitle id="alert-dialog-title">種ポケモンがいません</DialogTitle>
                <DialogContent>
                    <DialogContentText id="alert-dialog-description">
                        対戦相手に手札を公開し、マリガンをしてください。
                    </DialogContentText>
                </DialogContent>
                <DialogActions>
                    <Button onClick={Mulligan} color="secondary">
                        はい
                    </Button>
                </DialogActions>
            </Dialog> */}
        </Box>
    );
}

export default Competitive;