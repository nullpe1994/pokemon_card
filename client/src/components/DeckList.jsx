import React from 'react';
import {makeStyles, createStyles,} from '@material-ui/core';
import CreateDeckButton from './CreateDeckButton';

const useStyles = makeStyles(() => (
    createStyles ({
        'allStyles': {
            display: 'flex',
        },
        'cardStyles' : {
            display: 'flex', 
            flexDirection:'row',
            flexWrap: 'wrap',
            minWidth: 300,
            width: '100%',
        },
        'createPlaceStyles' : {
            
        }
    })
));
const DeckList = (props) => { 
    return (
        <CreateDeckButton isCorrect={props.isCorrect}/>
    );
}
export default DeckList;