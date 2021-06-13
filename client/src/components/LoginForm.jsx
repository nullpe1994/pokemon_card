import React, { useState } from 'react';
import Axios from 'axios';
import './../css/LoginForm.css';
import {Button, TextField, Box, makeStyles, createMuiTheme, ThemeProvider} from '@material-ui/core';
import {
    BrowserRouter as Router,
    useHistory,
  } from 'react-router-dom';

const useStyles = makeStyles({
    loginButton: {
        background: 'linear-gradient(45deg, #ee7701 30%, #ffdf00 90%)',
        border: 0,
        borderRadius: 3,
        boxShadow: '0 3px 5px 2px rgba(255, 105, 135, .3)',
        color: 'white',
        height: 48,
        padding: '20px 48px',
        margin: '40px 0px',
    },
});

const theme = createMuiTheme({
    overrides: {
        MuiInputLabel: { // Name of the component ⚛️ / style sheet
            root: { // Name of the rule
                color: 'white',
                '&$focused': { // increase the specificity for the pseudo class
                color: 'white'
                },
            }
        },

        MuiOutlinedInput: {
            input: {
                '&:-webkit-autofill': {
                '-webkit-box-shadow': '0 0 0 100px #282c34 inset',
                '-webkit-text-fill-color': 'white'
                }
            }
        }
    }
});

const Login = () => {
    const [userId,setUserId] = useState();
    const history = useHistory();
    const onChangeUserId = (props) => {
        setUserId(props.target.value);
    }
    const isCorrect = () => {
        Axios.get('http://localhost:3001/login',{ params: {user:userId}})
        .then((results) => {
            history.push({
                pathname: '/main',
                state: { userId: userId }
            });
            console.log(results);
        });
    }
    const classes = useStyles();
    return (
        <>
            <header className='login-header'>
                <img src='pokemonTitle.png' className='App-logo' alt='logo' />
            </header>
            <div className='login-form'>
                <ThemeProvider theme={theme}>
                    <TextField label='ユーザー' variant='outlined' value={userId} id='user' onChange={onChangeUserId} />
                </ThemeProvider>
                <Box>
                    <Button className={classes.loginButton} variant='outlined' color='primary' onClick={isCorrect}>
                        ログイン
                    </Button>
                </Box>
            </div>
        </>
    );
}

export default Login;