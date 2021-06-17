import React, { useEffect, useState } from 'react';
import Axios from 'axios';
import Card from './Card';
import CreatePlace from './CreatePlace';
import GridList from '@material-ui/core/GridList';
import GridListTile from '@material-ui/core/GridListTile';
import {makeStyles, createStyles,} from '@material-ui/core';

const useStyles = makeStyles(() => (
    createStyles ({
        'allStyles': {
            display: 'flex',
            height: '100%',
        },
        'cardStyles' : {
            display: 'flex', 
            flexDirection:'row',
            flexWrap: 'wrap',
            // width: '100%',
            width: '80%',
            height: '100%',
        },
        'createPlaceStyles' : {
            
        }
    })
));

const CreateDecks = (props) => { 
    const [cardlist, setCardlist] = useState([]);
    const [cardDetails, setCardDetails] = useState([]);
    const [count, setCount] = useState(0);
    const classes = useStyles();
    
    useEffect(async () => {
        const res = await Axios.post('http://localhost:3001/getcards')
        const json = await res.data[0];
        setCardlist(json.cardlist);
    },[props, setCardlist]);
    
    const isCorrect = (e) => {
        let ok = true;
        cardDetails.some((detail) => {
            if (detail.array.pokemon_card_id === e.pokemon_card_id) {
                if (detail.array.count < 4) {
                    // console.log(detail.array.pokemon_card_id);
                    detail.array.count += 1;
                    setCount(prevState => prevState + 1);
                }
                ok = false;
                return true;
            }
            console.log(detail.array);
        });
        if (ok) {
            const array = e;
            array['count'] = 1;
            setCardDetails([...cardDetails, {array}]);
            setCount(prevState => prevState + 1);
        }
    }

    return (
        <>
            <div className={classes.allStyles}>
                <GridList　cellHeight={'100%'} className={classes.cardStyles} cols={7}>
                    {/* 今後改善の余地ありけり。
                        受け取った値が再描画されてundefinedになってmapとして描画できない。
                    */}
                    {cardlist!=undefined && cardlist.map((pokeca) => (
                        <GridListTile>
                            <Card pokeca={pokeca} isCorrect={isCorrect}/>
                        </GridListTile>
                    ))}
                </GridList>
                <CreatePlace className={classes.createPlaceStyles} count={count} cardDetails={cardDetails} setBool={props.setBool}/>
            </div>
        </>
    );
}
export default CreateDecks;