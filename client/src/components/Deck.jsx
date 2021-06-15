import React, { useState } from 'react';
import CreateDecks from './CreateDecks';
import DeckList from './DeckList';

const Deck = () => {
    const [cIndex, setCindex] = React.useState(0);
    const handleClick = (event, cIndex) => {
        setCindex(1);
    };
    return (
        <>
            {cIndex === 0 && (
                <CreateDecks handleClick={handleClick} cIndex={cIndex}/>
            )}
            {cIndex === 1 && (
                <DeckList/>
            )}
        </>
    );
}

export default Deck;