import React from 'react';
import { Grid } from '@material-ui/core';
import PlacementOfCards from './PlacementOfCards';

const BenchCard = (props) => {
    return (
        <Grid item xs={props.xs}>
            <PlacementOfCards value={'Bench'}/>
        </Grid>
    );
}

export default BenchCard;