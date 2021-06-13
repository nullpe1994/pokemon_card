import React, { useState } from 'react';
import Axios from 'axios';
import './../css/LoginForm.css';
import ReactDOM from 'react-dom';
import {
    BrowserRouter as Router,
    Route,
    Switch,
    useParams,
    useHistory,
    useLocation,
  } from 'react-router-dom';

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
    return (
        <div className='login-form'>
            <input type="text" placeholder="ユーザーID" value={userId} id="user" onChange={onChangeUserId}/>
            <button onClick={isCorrect}>
                ログイン
            </button>
        </div>
    );
}

export default Login;