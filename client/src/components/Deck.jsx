import React, { useState } from 'react';
import CreateDecks from './CreateDecks';
import DeckList from './DeckList';

const Deck = (props) => {  

    const [bool, setBool] = useState(false);
    
    const onClick = () => {
        setBool(prevState => !prevState);
    }
        return (
        <div>
            {bool && (<CreateDecks setBool={setBool}/>)}
            {!bool && (<DeckList onClick={onClick}/>)}
        </div>
    );
}

export default Deck;