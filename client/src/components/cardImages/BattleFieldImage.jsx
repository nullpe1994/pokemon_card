import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import ButtonBase from '@material-ui/core/ButtonBase';
import {useRecoilValue,} from 'recoil';
import battleFieldState from '../State/battleFieldState';

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

const BattleFieldImage = () => {
    const classes = useStyles();
    const battlePokemon = useRecoilValue(battleFieldState);
    return (
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
                backgroundImage: `url(${battlePokemon.img_url})`,
            }}
            />
        </ButtonBase>
    );
}
export default BattleFieldImage;