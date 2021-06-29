import React from 'react';
import { Grid } from '@material-ui/core';
import HandCardImage from './HandCardImage';

const HandCard = (props) => {
    return (
        <Grid item xs={props.xs}>
            <HandCardImage handCard={props.handCard}/>
        </Grid>
    );
}

export default HandCard;