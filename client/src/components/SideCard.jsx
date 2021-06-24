import React from 'react';
import { Grid } from '@material-ui/core';
import PlacementOfCards from './PlacementOfCards';

const SideCard = (props) => {
    return (
        <Grid item xs={props.xs}>
            <PlacementOfCards value={'Side'}/>
        </Grid>
    );
}

export default SideCard;