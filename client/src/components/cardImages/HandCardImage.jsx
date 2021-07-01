import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import ButtonBase from '@material-ui/core/ButtonBase';
import Menu from '@material-ui/core/Menu';
import MenuItem from '@material-ui/core/MenuItem';
import {useRecoilState,} from 'recoil';
import yourHandState from '../State/yourHandState';
import battleFieldState from '../State/battleFieldState';

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
    const [yourHand, setYourHand] = useRecoilState(yourHandState);
    const [battleField, setBattleField] = useRecoilState(battleFieldState);
    const [anchorEl, setAnchorEl] = React.useState(null);

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

    const whitchSubtypes = (subtype) => {
        let text = "";
        if (subtype === 2) {
            text = "バトル場に出す"
        }
        return text;
    }

    const thisCard = (index) => {
        let yourhands = [...yourHand];
        setBattleField(yourHand[index]);
        yourhands.splice(index, 1);
        setYourHand(yourhands);
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
            <Menu
                id="simple-menu"
                anchorEl={anchorEl}
                keepMounted
                open={Boolean(anchorEl)}
                onClose={handleClose}
            >
                <MenuItem onClick={() => thisCard(props.index)}>{whitchSubtypes(props.handCard.subtypes[0])}</MenuItem>
            </Menu>
        </div>
    );
}
export default HandCardImage;