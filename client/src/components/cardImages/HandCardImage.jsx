import React,{ useState } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import ButtonBase from '@material-ui/core/ButtonBase';
import { useRecoilState, useRecoilValue } from 'recoil';
import yourHandState from '../State/yourHandState';
import CardComands from '../molecules/CardComands';

const useStyles = makeStyles((theme) => ({
    image: {
        position: 'relative',
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
    const yourHand = useRecoilValue(yourHandState);
    const [anchorEl, setAnchorEl] = useState(null);
    
    const handleClick = (event) => {
        setAnchorEl(event.currentTarget);
    };

    const handleClose = () => {
        setAnchorEl(null);
    };

    const image = {
        url: props.handCard.img_url,
        width: 130,
        height: 180,
    };

    return (
        <div>
            <ButtonBase
                focusRipple
                className={classes.image}
                style={{
                    width: image.width,
                    height: image.height,
                }}
                onClick={handleClick}                
            >
                <span
                    className={classes.imageSrc}
                    style={{
                        backgroundImage: `url(${image.url})`,
                    }}
                />
            </ButtonBase>
            <CardComands 
                supertype={yourHand[props.index].supertype} 
                index={props.index} 
                anchorEl={anchorEl}
                handleClose={handleClose}
            />
        </div>
    );
}
export default HandCardImage;