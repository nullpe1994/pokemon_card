import React, { useContext, useState } from 'react';
import { useRecoilState, useRecoilValue, useSetRecoilState} from 'recoil';
import Button from '@material-ui/core/Button';
import AcceptButton from '../atoms/AcceptButton';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import galleryState from '../State/galleryState';
import contentTextState from '../State/contentTextState';
import choosenCardsState from '../State/choosenCardsState';
import UserNameContext from '../Context/UserNameContext';
import ingameIdState from '../State/ingameIdState';
import howManyState from '../State/howManyState';
import battleFieldState from '../State/battleFieldState';
import benchState from '../State/benchState';
import displayGiveEnergyState from '../State/displayGiveEnergyState';
import PokemonGalleryImage from '../atoms/cardImages/PokemonGaleryImage';
import countState from '../State/countState';

const EnergySwitchGallery = (props) => {
    const battleField = useRecoilValue(battleFieldState);
    const bench = useRecoilValue(benchState);
	const [open, setOpen] = React.useState(true);
	const [scroll, setScroll] = React.useState('paper');
	const setContentText = useSetRecoilState(contentTextState);
	const [choosenCards, setChoosenCards] = useRecoilState(choosenCardsState);
    const setDisplayGiveEnergy = useSetRecoilState(displayGiveEnergyState);
	const [gallery, setGallery] = useRecoilState(galleryState);
	const userName = useContext(UserNameContext);
	const [countPhase, setCountPhase] = useState(0);
    const [count, setCount] = useRecoilState(countState);
	const [ingameId, setIngameId] = useRecoilState(ingameIdState);
    const setHowMany = useSetRecoilState(howManyState);
    const [title, setTitle] = useState('エネルギーつけかえ: つけかえるエネルギーを持つポケモンを選んで下さい');

	const handleClose = () => {
		setOpen(false);
        setCount(0);
        setChoosenCards([]);
	};

	const requestSearch = () => {
        let whichField = 0;
        switch (countPhase) {
            case 0:
                if (battleField.ingame_id === choosenCards[0]) whichField = 0;
                else whichField = 1;
                if (whichField === 0) {
                    setGallery(battleField.energyDetail);
                    setIngameId(battleField.ingame_id);
                }
                else {
                    let index = 0;
                    for (let i=0; i<bench.length; i++) {
                        if (bench[i].ingame_id === choosenCards[0]){
                            index = i;
                            setIngameId(bench[i].ingame_id);
                        }
                    }
                    setGallery(bench[index].energyDetail);
                }
                setCount(0);
                setTitle('エネルギーつけかえ: つけかえるエネルギーを選んでください');
                setCountPhase(prev => prev + 1);
                setChoosenCards([]);
                break;
            case 1:
                console.log(ingameId);
                console.log(choosenCards[0]);
                window.socket.emit('energySwitch', {
                    yourId: userName.yourId,
                    oppId: userName.oppId,
                    ingameId: ingameId,
                    getCards: choosenCards[0],
                    whichField: whichField,
                });
                setChoosenCards([]);
                setTitle('エネルギーつけかえ: エネルギーをつけるポケモンを選んで下さい');
                setCount(0);
                setHowMany(1);
                setIngameId(choosenCards[0]);
                setCountPhase(prev => prev + 1);
                break;
            case 2 :
                if (battleField.ingame_id === choosenCards[0]) whichField = 0;
                else whichField = 1;
                window.socket.emit('energySwitchCaseTwo', {
                    yourId: userName.yourId,
                    oppId: userName.oppId,
                    ingameId: ingameId,
                    getCards: choosenCards[0],
                    whichField: whichField,
                });
		    setOpen(false);
        }
	}

	const descriptionElementRef = React.useRef(null);
	React.useEffect(() => {
		if (open) {
			const { current: descriptionElement } = descriptionElementRef;
			if (descriptionElement !== null) {
				descriptionElement.focus();
			}
		}
	}, [open]);

	return (
        <Dialog
            open={open}
            fullWidth={true}
            maxWidth={'md'}
            scroll={scroll}
            aria-labelledby="scroll-dialog-title"
            aria-describedby="scroll-dialog-description"
        >
        <DialogTitle id="scroll-dialog-title">{title}</DialogTitle>
            {(countPhase === 0 || countPhase === 2) && (
                <DialogContent dividers={scroll === 'paper'}>
                    <DialogContentText> {'バトル場'} </DialogContentText>
                        <PokemonGalleryImage card={battleField} ingameId={battleField.ingame_id}/>
                    <DialogContentText> {'ベンチ'} </DialogContentText>
                        {Object.keys(bench).map(key => 
                            <PokemonGalleryImage key={bench[key].ingame_id} card={bench[key]} ingameId={bench[key].ingame_id}/>	
                        )}
                </DialogContent>
            )}
            {countPhase === 1 && (
                <DialogContent dividers={scroll === 'paper'}>
                        {Object.keys(gallery).map(key => 
                            <PokemonGalleryImage key={gallery[key].ingame_id} card={gallery[key]} ingameId={gallery[key].ingame_id}/>	
                        )}
                </DialogContent>
            )}
        <DialogActions>
            <Button onClick={requestSearch} color="secondary">
                確定
            </Button>
        </DialogActions>
        </Dialog>
	);
}

export default EnergySwitchGallery;