import React from 'react';
import CreateDecks from './CreateDecks';
import DeckList from './DeckList';

function Deck () {  
    const [bool, setBool] = React.useState(false);
    const isCorrect = () => {
        setBool(!bool);
    }
        return (
        <div>
            {bool && (<CreateDecks/>)}
            {!bool && (<DeckList isCorrect={isCorrect}/>)}
        </div>
    );
}

export default Deck;