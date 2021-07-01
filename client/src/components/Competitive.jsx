import React, { useState } from 'react';
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
import {useRecoilState, useSetRecoilState} from 'recoil';
import yourHandState from './State/yourHandState';
import yourSideCardsState from './State/yourSideCardsState';

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
    const [acceptButtonName, setAcceptButtonName] = useState('先攻');
    const [declineButtonName, setDeclineButtonName] = useState('後攻');
    const [yourHand, setYourHand] = useRecoilState(yourHandState);
    const setYourSideCards = useSetRecoilState(yourSideCardsState);
    const [phase, setPhase] = useState('0');
    const [noBasic, setNoBasic] = useState(false);

    const Draw = () => {
        const newCard = DrawACard(deck.cards);
        setYourHand((prevArray) => [...prevArray, newCard]);
        deck.cards.pop();
        return newCard;
    }
    
    console.log(deck.cards);
    
    const Mulligan = () => {
        let card = "";
        let basicCnt = 0;
        
        yourHand.map(card => {
            deck.cards.push(card);
        });
        setYourHand([]);
        for (let i=0; i<7; i++) ShuffleTheDeck(deck.cards);

        for (let i=0; i<7; i++) {
            card = Draw();
            card.subtypes.filter((subtype) => {
                if (subtype === 2) basicCnt++;
            });
        }

        if (basicCnt === 0) setNoBasic(true);
        else {
            setNoBasic(false);
            for (let i=0; i<6; i++) SetSideCards();
        }

    }
    
    const SetSideCards = () => {
        const newCard = DrawACard(deck.cards);
        setYourSideCards((prevArray) => [...prevArray, newCard]);
        deck.cards.pop();
    }

    const isCorrect = () => {
        let card = "";
        let basicCnt = 0;

        for (let i=0; i<7; i++) {
            card = Draw();
            card.subtypes.filter((subtype) => {
                if (subtype === 2) {
                    basicCnt++;
                }
            });
        }

        if (basicCnt === 0) setNoBasic((prev) => !prev);
        else {
            setNoBasic(false);
            for (let i=0; i<6; i++) SetSideCards();
        }
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
                acceptName={acceptButtonName} 
                declineName={declineButtonName}
                isCorrect={isCorrect}
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