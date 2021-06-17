import React from 'react';
import CreateDecks from './CreateDecks';
import DeckList from './DeckList';

const Deck = () => {  

    const [bool, setBool] = React.useState(false);
    
    const isCorrect = () => {
        setBool(prevState => !prevState);
    }
        return (
        <div>
            {bool && (<CreateDecks setBool={setBool}/>)}
            {!bool && (<DeckList isCorrect={isCorrect}/>)}
        </div>
    );
}

export default Deck;