import React from 'react';
import './LoginForm.css';

const Login = () => {
    return (
        <div className='login-form'>
            <form>
                <input placeholder="ユーザーID"/>
                <input type="submit" value='ログイン'/>
            </form>
        </div>
    );
}

export default Login;