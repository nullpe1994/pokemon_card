import React from 'react';
import { Grid } from '@material-ui/core';
import PlacementOfCards from './PlacementOfCards';

const HandCard = (props) => {
    return (
        <Grid item xs={props.xs}>
            <PlacementOfCards value={'Hand'}/>
        </Grid>
    );
}

export default HandCard;