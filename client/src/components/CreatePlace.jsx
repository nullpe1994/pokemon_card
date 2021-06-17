import React, { useEffect } from 'react';
import { makeStyles } from '@material-ui/core/styles';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import InboxIcon from '@material-ui/icons/Inbox';
import AcceptButton from './AcceptButton';

const useStyles = makeStyles((theme) => ({
  root: {
    width: '100%',
    maxWidth: 400,
    backgroundColor: theme.palette.background.paper,
    marginLeft: '3%',
  },
  allStyles: {
    display: 'flex',

  },
  buttonStyles: {
    height: '35px',
    width: '10%',
    margin: '2%',
  },
  ptagStyles: {
    margin: '3%',
  }
}));

const CreatePlace = (props) => {
    const classes = useStyles();
    const isCorrect = () => {
        //length後々変更します
        if (props.cardDetails.length <= 1) {
            props.setBool(prevState => !prevState);
        } else alert('デッキ枚数が60枚に達していません!');
    }

    return (
    <div className={classes.root}>
        <List component="nav" aria-label="main mailbox folders">
            {props.cardDetails.map((cardDetail)=>
            <div className={classes.allStyles}>
              {/* 追加ボタン */}
                <button className={classes.buttonStyles}/>
                {/* 削除ボタン */}
                <ListItem button>
                  {/* 属性アイコン予定 */}
                    <ListItemIcon>
                        <InboxIcon />
                    </ListItemIcon>
                    <ListItemText primary={cardDetail.array.pokemon_card_name}/>
                </ListItem>
              <p className={classes.ptagStyles}>{cardDetail.array.count}</p>
            </div>
            )}
            <p>{props.count}</p>
            <AcceptButton name={'完了'} isCorrect={isCorrect}/>
        </List>
    </div>
  );
}
export default CreatePlace;