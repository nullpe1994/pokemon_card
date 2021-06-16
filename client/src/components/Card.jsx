import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import ButtonBase from '@material-ui/core/ButtonBase';

const useStyles = makeStyles((theme) => ({
    image: {
        position: 'relative',
        height: 400,
        margin: '10px',
        [theme.breakpoints.down('xs')]: {
            width: '100% !important', // Overrides inline-style
            height: 400,
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
}));

const Card = (props) => {
    const classes = useStyles();
    
    const image = {
        url: props.imgUrl,
        width: '97%',
    };

    console.log(props.imgUrl);

    return (
            <ButtonBase
            focusRipple
            className={classes.image}
            focusVisibleClassName={classes.focusVisible}
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
            <span className={classes.imageBackdrop} />
            <span className={classes.imageButton}>
            </span>
        </ButtonBase>
  );
}
export default Card;