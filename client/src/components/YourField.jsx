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

const YourField = () => {
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
                <PlacementOfCards value={placeNames.Deck}/>
            </Grid>
            <SideCard xs={1}/>
            <SideCard xs={2}/>
            <HandCard xs={1}/>
            <HandCard xs={1}/>
            <HandCard xs={1}/>
            <HandCard xs={1}/>
            <HandCard xs={2}/>
            <Grid item xs={1}>
                <PlacementOfCards value={placeNames.Trash}/>
            </Grid>
        </Grid>
    );
}

export default YourField;