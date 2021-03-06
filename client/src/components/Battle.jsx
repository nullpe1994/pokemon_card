import React, { useState, useEffect, useContext } from 'react';
import Axios from 'axios';
import Button from '@material-ui/core/Button';
import TextField from '@material-ui/core/TextField';
import { makeStyles } from '@material-ui/core/styles';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import ImageButton from './common/ImageButton';
import SelectDecks from './SelectDecks';
import UserNameContext from './UserNameContext';

const Titles = {battle: '対戦', friendBattle: 'フレンドと対戦'}

const useStyles = makeStyles((theme) => ({
    image: {
        position: 'relative',
        width:'35%',
        height: 1000,
        marginLeft: '20px',
        [theme.breakpoints.down('xs')]: {
            width: '100% !important', // Overrides inline-style
            height: 100,
        },
        '&:hover, &$focusVisible': {
            zIndex: 1,
            '& $imageBackdrop': {
                opacity: 0.15,
            },
            '& $imageMarked': {
                opacity: 0,
            },
            '& $imageTitle': {
                border: '4px solid currentColor',
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
    imageBackdrop: {
        position: 'absolute',
        left: 0,
        right: 0,
        top: 0,
        bottom: 0,
        backgroundColor: theme.palette.common.black,
        opacity: 0.4,
        transition: theme.transitions.create('opacity'),
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
}));

const Battle = () => {
    const userName = useContext(UserNameContext);
    const [open, setOpen] = useState(false);
    const [bool, setBool] = useState(false);
    const [userDecks, setUserDecks] = useState([]);

    const onClick = () => {
        setOpen(true);
    };

    const handleClose = () => {
        setOpen(false);
    };

    const chooseOpponent = () => {
        setBool(prevState => !prevState);
        handleClose();
    };

    useEffect(() => {
        // async を 関数としないと謎のエラーが出たので関数にしました。
        async function fetchData() {
            const res = await Axios.post('http://localhost:3001/getDeck',{
                userId: userName,
            });
            const json = await res.data[0];
            setUserDecks(json.userDeck);
        }
        fetchData();
    },[userName,setUserDecks]);
    const classes = useStyles();

    return (
        <div className={classes.root}>
            {!bool && <ImageButton classes={classes} Title={Titles.battle}/>}
            {!bool && <ImageButton classes={classes} Title={Titles.friendBattle} onClick={onClick}/>}
            {bool && <SelectDecks userDecks={userDecks}/>}
            <Dialog open={open} onClose={handleClose} aria-labelledby="form-dialog-title">
                <DialogTitle id="form-dialog-title">フレンドと対戦</DialogTitle>
                <DialogContent>
                    <DialogContentText>
                        対戦相手のユーザーIDを入力してください。<br/>
                        あなたのユーザーID:{userName}
                    </DialogContentText>
                    <TextField
                        autoFocus
                        margin="dense"
                        id="name"
                        label="ユーザーID"
                        type="text"
                        fullWidth
                        color="secondary"
                    />
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleClose} color="secondary">
                        キャンセル
                    </Button>
                    <Button onClick={chooseOpponent} color="secondary">
                        確定
                    </Button>
                </DialogActions>
            </Dialog>
        </div>
    );
}

export default Battle;