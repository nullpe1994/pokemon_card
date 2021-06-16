import React, { useEffect, useState } from 'react';
import Axios from 'axios';
import AcceptButton from './AcceptButton';
import Card from './Card';
import CreatePlace from './CreatePlace';
import GridList from '@material-ui/core/GridList';
import GridListTile from '@material-ui/core/GridListTile';
import {makeStyles, createStyles,} from '@material-ui/core';
import {
    BrowserRouter as Router,
    useHistory,
} from 'react-router-dom';

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
    const history = useHistory();
    const classes = useStyles();
    
    useEffect(async () => {
        const res = await Axios.post('http://localhost:3001/getcards')
        const json = await res.data[0];
        setCardlist(json.cardlist);
    },[props, setCardlist]);
    console.log(cardlist);

    return (
        <>
        <div className={classes.allStyles}>
            <GridList　cellHeight={'100%'} className={classes.cardStyles} cols={7}>
                {/* 今後改善の余地ありけり。
                    受け取った値が再描画されてundefinedになってmapとして描画できない。
                */}
                {cardlist!=undefined && cardlist.map((pokeca) => (
                    <GridListTile>
                        <Card  imgUrl={pokeca.img_url}/>
                    </GridListTile>
                ))}
            </GridList>
            <CreatePlace className={classes.createPlaceStyles}/>
        </div>
            <AcceptButton name={'完了'}/>
        </>
    );
}
export default CreateDecks;