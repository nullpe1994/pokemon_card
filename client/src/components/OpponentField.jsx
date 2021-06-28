import React from 'react';
import { Grid } from '@material-ui/core';
import SideCard from './SideCard';
import BenchCard from './BenchCard';
import HandCard from './HandCard';
import PlacementOfCards from './PlacementOfCards';

const placeNames = {
    Side: 'Side', 
    BattleField: 'BattleField',
    Deck: 'Deck', 
    Bench: 'Bench', 
    Trash:'Trash'
}

const opponentField = () => {
    return (
        <Grid container spacing={1}>
            <Grid item xs={1}/>
            <Grid item xs={2}>
                <PlacementOfCards value={placeNames.Trash}/>
            </Grid>
            <HandCard xs={1}/>
            <HandCard xs={1}/>
            <HandCard xs={1}/>
            <HandCard xs={1}/>
            <HandCard xs={2}/>
            <SideCard xs={1}/>
            <SideCard xs={2}/>
            <Grid item xs={1}/>
            <Grid item xs={2}>
                <PlacementOfCards value={placeNames.Deck}/>
            </Grid>
            <BenchCard xs={1}/>
            <BenchCard xs={1}/>
            <BenchCard xs={1}/>
            <BenchCard xs={1}/>
            <BenchCard xs={2}/>
            <SideCard xs={1}/>
            <SideCard xs={2}/>
            <Grid item xs={5}/>
            <Grid item xs={4}>
                <PlacementOfCards value={placeNames.BattleField}/>
            </Grid>
            <SideCard xs={1}/>
            <SideCard xs={2}/>
        </Grid>
    );
}

export default opponentField;