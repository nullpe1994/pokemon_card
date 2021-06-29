import React from 'react';
import { Grid } from '@material-ui/core';
import SideCard from './SideCard';
import BenchCard from './BenchCard';
import HandCard from './HandCard';
import PlacementOfCards from './PlacementOfCards';
import AcceptButton from './common/AcceptButton';
import DeckImage from './DeckImage';

const placeNames = {
    Side: 'Side', 
    BattleField: 'BattleField',
    Deck: 'Deck', 
    Bench: 'Bench', 
    Trash:'Trash'
}

const YourField = (props) => {
    return(
        <Grid container spacing={1}>
            <SideCard xs={1}/>
            <SideCard xs={4}/>
            <Grid item xs={1}>
                <PlacementOfCards value={placeNames.BattleField}/>
            </Grid>
            <Grid item xs={6}/>
            <SideCard xs={1}/>
            <SideCard xs={2}/>
            <BenchCard xs={1}/>
            <BenchCard xs={1}/>
            <BenchCard xs={1}/>
            <BenchCard xs={1}/>
            <BenchCard xs={2}/>
            <Grid item xs={3}>
                <DeckImage deck={props.deck}/>
            </Grid>
            <SideCard xs={1}/>
            <SideCard xs={2}/>
            {props.yourHand.map((handCard) =>
                <div>
                    <HandCard xs={1} handCard={handCard.img_url}/>
                </div>
            )}
            <Grid item xs={1}>
                <PlacementOfCards value={placeNames.Trash}/>
            </Grid>
            <Grid item xs={1}>
                <AcceptButton name={props.declineName} isCorrect={props.isCorrect}/>
            </Grid>
            <Grid item xs={1}>
                <AcceptButton name={props.acceptName} isCorrect={props.isCorrect}/>
            </Grid>
        </Grid>
    );
}

export default YourField;