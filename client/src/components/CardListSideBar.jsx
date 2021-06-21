import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Drawer from '@material-ui/core/Drawer';
import List from '@material-ui/core/List';
import Divider from '@material-ui/core/Divider';
import ListItem from '@material-ui/core/ListItem';
import ListItemText from '@material-ui/core/ListItemText';
import AcceptButton from './common/AcceptButton'

const drawerWidth = 240;

const useStyles = makeStyles((theme) => ({
  root: {
    display: 'flex',
  },
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
  },
  drawerPaper: {
    marginTop: '2%',
    width: drawerWidth,
  },
  drawerContainer: {
    overflow: 'auto',
  },
}));

const CardListSideBar = () => {
  const classes = useStyles();

  return (
    <Drawer
        className={classes.drawer}
        variant="permanent"
        classes={{
            paper: classes.drawerPaper,
        }}
        anchor="right"
    >
        <div className={classes.drawerContainer}>
            <List>
            {['Inbox', 'Starred', 'Send email', 'Drafts'].map((text, index) => (
                <ListItem button key={text}>
                <ListItemText primary={text} />
                </ListItem>
            ))}
            </List>
            <Divider/>
            <List>
                <AcceptButton name={'プレイ'}/>
            </List>
        </div>
    </Drawer>
  );
}

export default CardListSideBar;