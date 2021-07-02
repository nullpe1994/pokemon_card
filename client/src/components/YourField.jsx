import React from 'react';
import { Grid } from '@material-ui/core';
import PlacementOfCards from './PlacementOfCards';
import AcceptButton from './common/AcceptButton';
import HandCardImage from './cardImages/HandCardImage';
import DeckImage from './cardImages/DeckImage';
import BattleFieldImage from './cardImages/BattleFieldImage';
import SideCardImage from './cardImages/SideCardImage';
import yourSideCardsState from './State/yourSideCardsState';
import { useRecoilValue } from 'recoil';
import offTurnDisplayState from './State/offTurnDisplayState';

const placeNames = { 
    Trash:'Trash'
}

const YourField = (props) => {
    const sideCards = useRecoilValue(yourSideCardsState);
    const offTurnDisplay = useRecoilValue(offTurnDisplayState);

    return(
        <Grid container spacing={0}>
            <Grid item xs={2}>
                <Grid container spacing={0}>
                    {Object.keys(sideCards).map(key =>
                        <Grid item xs={5.5}>
                            <SideCardImage sideCards={sideCards[key]} index={key}/>
                        </Grid>
                    )}
                </Grid>
            </Grid>
            <Grid item xs={7}>
                <Grid container spacing={0}>
                    <Grid item xs={12}>
                        <BattleFieldImage/>
                    </Grid>
                    <Grid item xs={12}>
                        {/* ベンチカード予定 */}
                    </Grid>
                    <Grid item xs={12}>
                        <Grid  container spacing={5}>
                            {Object.keys(props.yourHand).map(key =>
                                <Grid item xs={1.5}>
                                    <HandCardImage handCard={props.yourHand[key]} index={key}/>
                                </Grid>
                            )}
                        </Grid>
                    </Grid>
                </Grid>
            </Grid>
            <Grid item xs={3}>
                <Grid container spacing={0}>
                    {/* ダメカン表示予定場所 */}
                    <Grid item xs={12}>
                        <DeckImage deck={props.deck}/>
                    </Grid>
                    <Grid item xs={12}>
                        <PlacementOfCards value={placeNames.Trash}/>
                    </Grid>
                    <Grid item xs={6}>
                        {offTurnDisplay && (
                            <AcceptButton name={'後攻'} isCorrect={props.chooseYourOrder}/>
                        )}
                    </Grid>
                    <Grid item xs={6}>
                        {offTurnDisplay && (
                            <AcceptButton name={'先攻'} isCorrect={props.chooseYourOrder}/>
                        )}
                    </Grid>
                </Grid>
            </Grid>
        </Grid>
    );
}

export default YourField;