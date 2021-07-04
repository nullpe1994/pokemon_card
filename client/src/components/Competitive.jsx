import React, { useEffect, useState } from 'react';
import jirachi from '../image/jirachiWallPaper.jpg'
import { makeStyles, Box, Divider } from '@material-ui/core';
import OpponentField from './OpponentField';
import YourField from './YourField';
import DrawACard from './function/DrawACard';
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import ShuffleTheDeck from './function/ShuffleTheDeck';
import {useRecoilState, useRecoilValue, useSetRecoilState} from 'recoil';
import yourHandState from './State/yourHandState';
import yourSideCardsState from './State/yourSideCardsState';
import phaseState from './State/phaseState';
import battleFieldState from './State/battleFieldState';
import offTurnDisplayState from './State/offTurnDisplayState';

const useStyles = makeStyles(() => ({
    root: {
        flexWrap: 'wrap',
    },
    sideCardsBox: {
        flexWrap: 'wrap',
    },
    you: {
    },
    opponent: {
    },
}));


const Competitive = (props) => {
    const classes = useStyles();  
    const deck = props.location.state.deck;
    const [yourHand, setYourHand] = useRecoilState(yourHandState);
    const setYourSideCards = useSetRecoilState(yourSideCardsState);
    const [phase, setPhase] = useRecoilState(phaseState);
    const battleField = useRecoilValue(battleFieldState);
    const setOffTurnDisplay = useSetRecoilState(offTurnDisplayState);
    const [noBasic, setNoBasic] = useState(false);
    
    useEffect(async () => {
        if (phase === 0) {
            if (battleField.length !== 0) {
                for (let i=0; i<6; i++) {
                    await SetSideCards();
                }
                setPhase(prev => prev+1);
            }
        } else if (phase === 1) {
            await Draw();
            setPhase(prev => prev+1);
        } else if (phase === 2) {
            console.log('done draw, now your turn')
        }
    },[battleField,phase]);
    
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
                const card = DrawACard(deck.cards);
                setYourSideCards((prevArray) => [...prevArray, card]);
                deck.cards.pop();
                resolve();
            },150);
        });
    }

    const Draw = () => {
        return new Promise(resolve => {
            setTimeout(() => {
                const card = DrawACard(deck.cards);
                setYourHand((prevArray) => [...prevArray, card]);
                deck.cards.pop();
                resolve(card);
            }, 150);
        });
    }
    
    const chooseYourOrder = async () => {
        setOffTurnDisplay(false);
        let basicCnt = 0;
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

    return (
        <Box style={{
            backgroundImage: `url(${jirachi})`,
            backgroundSize: 'cover',
            }}
            p={{md: 5}}
        >
            <OpponentField/>
            <Divider/>
            <YourField 
                chooseYourOrder={chooseYourOrder}
                yourHand={yourHand}
                deck = {deck}
            />
            <Dialog
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
            </Dialog>
        </Box>
    );
}

export default Competitive;