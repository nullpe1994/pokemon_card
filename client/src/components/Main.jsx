import React from 'react'

const Main = (props) => {
    console.log(props)
    return (
        <div className="main-page">
            <p>ようこそ！</p>
            <p>{props.location.state.userId}</p>
        </div>
    );
}

export default Main;