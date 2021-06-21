import React from 'react';
import SectionTab from './SectionTab';
import Home from './Home';
import Deck from './Deck';
import Battle from './Battle';
import './../css/style.css';

const sectionTab = {home: 'ホーム', deck: 'デッキ', battle: '対戦'}

const Main = (props) => {
    const [value, setValue] = React.useState(0);
    const handleChange = (event, newValue) => {
        setValue(newValue);
    };

    return (
        <div className='main-page'>
            <SectionTab name={sectionTab} handleChange={handleChange} value={value}/>
            {value === 0 && (
                <Home/>
            )} 
            {value === 1 && (
                <Deck userId={props.location.state.userId}/>
            )}
            {value === 2 && (
                <Battle userId={props.location.state.userId}/>
            )}
        </div>
    );
}

export default Main;