import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import ButtonBase from '@material-ui/core/ButtonBase';
import EnergyBadge from '../../molecules/EnergyBadge';
import Typography from '@material-ui/core/Typography';
import Tooltip from '@material-ui/core/Tooltip';

const useStyles = makeStyles((theme) => ({
    image: {
        position: 'relative',
        margin: '10px',
        [theme.breakpoints.down('xs')]: {
            width: '100% !important', // Overrides inline-style
            height: 400,
        },
        '&:hover, &$focusVisible': {
            zIndex: 1,
            '& $imageMarked': {
                opacity: 0,
            },
            '& $imageTitle': {
                opacity: 0,
            },
        },
    },
    focusVisible: {},
    imageButton: {
        position: 'absolute',
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        display: 'flex',
        alignItems: 'center',
        justifyContent: 'center',
        color: theme.palette.common.white,
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
    imageTitle: {
        position: 'relative',
        padding: `${theme.spacing(2)}px ${theme.spacing(4)}px ${theme.spacing(1) + 6}px`,
    },
    imageMarked: {
        height: 3,
        width: 18,
        backgroundColor: theme.palette.common.white,
        position: 'absolute',
        bottom: -2,
        left: 'calc(50% - 9px)',
        transition: theme.transitions.create('opacity'),
    },
    iconEnergy: {
        position: 'absolute',
        left: '90%',
    }
}));

const BenchCardImage = (props) => {
    const classes = useStyles();
    const bench = props.benchCard;
    const image = {
        url: bench.img_url,
        width: 130,
        height: 180,
    };

    return (
        <Tooltip title={
            <span>
                <span style={{whiteSpace: 'pre-line'}}>
                    {bench.energyDetail !== undefined && (bench.energyDetail.map(energy => `エナジーカード: ${energy.card_name} \n`))}
                </span>
                <span style={{whiteSpace: 'pre-line'}}>
                    {bench.toolDetail !== undefined && (bench.toolDetail.map(tool => `ポケモンのどうぐ: ${tool.card_name} \n`))}
                </span>    
             </span>}   
        >
            <ButtonBase
                focusRipple
                className={classes.image}
                style={{
                    width: image.width,
                    height: image.height,
                }}            
            >
                <span
                    className={classes.imageSrc}
                    style={{
                        backgroundImage: `url(${image.url})`,
                    }}
                />
                <span className={classes.imageButton}>
                    <Typography
                        component="span"
                        variant="subtitle1"
                        color="inherit"
                        className={classes.imageTitle}
                    >
                        {'Bench'}
                        <span className={classes.imageMarked} />
                    </Typography>
                </span>
                <span className={classes.iconEnergy}>
                    <EnergyBadge card={bench}/>
                </span>
            </ButtonBase>
        </Tooltip>
    );
}
export default BenchCardImage;