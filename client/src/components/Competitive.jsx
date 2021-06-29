import React, { useState } from 'react';
import jirachi from '../image/jirachiWallPaper.jpg'
import { makeStyles, Box, Divider } from '@material-ui/core';
import OpponentField from './OpponentField';
import YourField from './YourField';
import DrawACard from './function/DrawACard';
import AcceptButton from './common/AcceptButton';

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
    const [yourHand, setYourHand] = useState([]);
    const [acceptButtonName, setAcceptButtonName] = useState('先攻');
    const [declineButtonName, setDeclineButtonName] = useState('後攻');
    const [phase, setPhase] = useState('0');

    const Draw = () => {
        const newCard = DrawACard(deck.cards);
        setYourHand((prevArray)=>[...prevArray, newCard]);
        deck.cards.pop();
    }

    const isCorrect = () => {
        for (let i=0; i<7; i++) {
            Draw();
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
        </Box>
    );
}

export default Competitive;