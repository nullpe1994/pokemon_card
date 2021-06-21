import React from 'react';
import CreateDecks from './CreateDecks';
import DeckList from './DeckList';

const Deck = (props) => {  

    const [bool, setBool] = React.useState(false);
    
    const isCorrect = () => {
        setBool(prevState => !prevState);
    }
        return (
        <div>
            {bool && (<CreateDecks userId={props.userId} setBool={setBool}/>)}
            {!bool && (<DeckList isCorrect={isCorrect}/>)}
        </div>
    );
}

export default Deck;