import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import ButtonBase from '@material-ui/core/ButtonBase';
import Tooltip from '@material-ui/core/Tooltip';
import pokeUra from '../../image/poke_ura.jpg';

const useStyles = makeStyles((theme) => ({
    root: {
        position: 'relative',
    },
    image: {
        position: 'relative',
        height: 180,
        margin: '10px',
        [theme.breakpoints.down('xs')]: {
            width: '100% !important', // Overrides inline-style
            height: 400,
        },
    },
    imageSrc: {
        position: 'absolute',
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        backgroundSize: 'cover',
        backgroundPosition: 'center 40%',
        borderRadius: '5%',
    },
}));

const HandCardImage = (props) => {
    const classes = useStyles();

    return (
        <Tooltip title={props.deck.cards.length}>
            <ButtonBase
                focusRipple
                className={classes.image}
                style={{
                    width: 130,
                }}
                >
                <span
                className={classes.imageSrc}
                style={{
                    backgroundImage: `url(${pokeUra})`,
                }}
                />
            </ButtonBase>
        </Tooltip>
    );
}
export default HandCardImage;