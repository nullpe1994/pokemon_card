import React from 'react';
import jirachi from '../image/jirachiWallPaper.jpg'
import { makeStyles, Box, Grid, Divider } from '@material-ui/core';
import SideCard from './SideCard';
import BenchCard from './BenchCard';
import HandCard from './HandCard';
import PlacementOfCards from './PlacementOfCards';

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

const Competitive = () => {
    const classes = useStyles();

    const placeNames = {
        Side: 'Side', 
        BattleField: 'BattleField',
        Deck: 'Deck', 
        Bench: 'Bench', 
        Trash:'Trash'
    }

    return (
        <Box style={{
            backgroundImage: `url(${jirachi})`,
            backgroundSize: 'cover',
            }}
            p={{md: 12.8}}
        >
            <Grid className={classes.opponent} container spacing={1}>
                <Grid item xs={4}>
                    <PlacementOfCards value={placeNames.Trash}/>
                </Grid>
                <HandCard xs={1}/>
                <HandCard xs={1}/>
                <HandCard xs={1}/>
                <HandCard xs={1}/>
                <HandCard xs={2}/>
                <SideCard xs={1}/>
                <SideCard xs={1}/>
                <Grid item xs={4}>
                    <PlacementOfCards value={placeNames.Deck}/>
                </Grid>
                <BenchCard xs={1}/>
                <BenchCard xs={1}/>
                <BenchCard xs={1}/>
                <BenchCard xs={1}/>
                <BenchCard xs={2}/>
                <SideCard xs={1}/>
                <SideCard xs={1}/>
                <Grid item xs={6}/>
                <Grid item xs={4}>
                    <PlacementOfCards value={placeNames.BattleField}/>
                </Grid>
                <SideCard xs={1}/>
                <SideCard xs={1}/>
            </Grid>
            <Divider/>
            <Grid className={classes.you} container spacing={1}>
                <SideCard xs={1}/>
                <SideCard xs={5}/>
                <Grid item xs={1}>
                    <PlacementOfCards value={placeNames.BattleField}/>
                </Grid>
                <Grid item xs={5}/>
                <SideCard xs={1}/>
                <SideCard xs={3}/>
                <BenchCard xs={1}/>
                <BenchCard xs={1}/>
                <BenchCard xs={1}/>
                <BenchCard xs={1}/>
                <BenchCard xs={3}/>
                <Grid item xs={1}>
                    <PlacementOfCards value={placeNames.Deck}/>
                </Grid>
                <SideCard xs={1}/>
                <SideCard xs={3}/>
                <HandCard xs={1}/>
                <HandCard xs={1}/>
                <HandCard xs={1}/>
                <HandCard xs={1}/>
                <HandCard xs={3}/>
                <Grid item xs={1}>
                    <PlacementOfCards value={placeNames.Trash}/>
                </Grid>
            </Grid>
        </Box>
    );
}

export default Competitive;