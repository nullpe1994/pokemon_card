import React, {useContext} from 'react';
import { useRecoilState, useRecoilValue, useSetRecoilState } from 'recoil';
import Button from '@material-ui/core/Button';
import Dialog from '@material-ui/core/Dialog';
import DialogActions from '@material-ui/core/DialogActions';
import DialogContent from '@material-ui/core/DialogContent';
import DialogContentText from '@material-ui/core/DialogContentText';
import DialogTitle from '@material-ui/core/DialogTitle';
import PokemonGalleryImage from '../atoms/cardImages/PokemonGaleryImage';
import displayGiveEnergyState from '../State/displayGiveEnergyState';
import battleFieldState from '../State/battleFieldState';
import benchState from '../State/benchState';
import countState from '../State/countState';
import choosenCardsState from '../State/choosenCardsState';
import howManyState from '../State/howManyState';
import ingameIdState from '../State/ingameIdState';
import UserNameContext from '../Context/UserNameContext';
import displayGiveToolState from '../State/displayGiveToolState';
import contentTextState from '../State/contentTextState';

const FieldPokemonGallery = () => {
    const battleField = useRecoilValue(battleFieldState);
    const bench = useRecoilValue(benchState);
    const ingameId = useRecoilValue(ingameIdState);
    const userName = useContext(UserNameContext);
    const [open, setOpen] = React.useState(true);
    const [choosenCards,　setChoosenCards] = useRecoilState(choosenCardsState);
    const howMany = useRecoilValue(howManyState);
    const contentText = useRecoilValue(contentTextState);
    const [count, setCount] = useRecoilState(countState);
    const [displayGiveTool, setDisplayGiveTool] = useRecoilState(displayGiveToolState);
    const [displayGiveEnergy, setDisplayGiveEnergy] = useRecoilState(displayGiveEnergyState);

    const handleClose = () => {
        setOpen(false);
        setChoosenCards([]);
        setCount(0);
        if (displayGiveEnergy) setDisplayGiveEnergy(false);
    };

    const setEnergyToPokemon = () => {
        let whichField = 0;
        console.log(choosenCards[0]);
        if (battleField.ingame_id === choosenCards[0]) whichField = 0;
        else whichField = 1;
        if (displayGiveEnergy) {
            if (howMany === count) {
                // エナジーを追加するポケモンIDと追加するエナジーのカードIDをAPIに送って
                // ポケモンIDのEnergyDetailにエナジーカードのDetail、
                // energyCntに紐づいている属性のカウントをPlusする
                window.socket.emit('giveEnergy', {
                    yourId: userName.yourId,
                    oppId: userName.oppId,
                    ingameId: ingameId,
                    getCards: choosenCards[0],
                    whichField: whichField,
                });
            }
            setOpen(false);
            setChoosenCards([]);
            setCount(0);
            setDisplayGiveEnergy(false);
        }
        if (displayGiveTool) {
            if (howMany === count) {
                window.socket.emit('giveTool', {
                    yourId: userName.yourId,
                    oppId: userName.oppId,
                    ingameId: ingameId,
                    getCards: choosenCards[0],
                    whichField: whichField,
                });
            }
            setOpen(false);
            setChoosenCards([]);
            setCount(0);
            setDisplayGiveTool(false);
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
            onClose={handleClose}
            aria-labelledby="scroll-dialog-title"
            aria-describedby="scroll-dialog-description"
        >
        <DialogTitle id="scroll-dialog-title">{contentText}</DialogTitle>
        <DialogContent>
            <DialogContentText> {'バトル場'} </DialogContentText>
                <PokemonGalleryImage card={battleField} ingameId={battleField.ingame_id}/>
            <DialogContentText> {'ベンチ'} </DialogContentText>
                {Object.keys(bench).map(key => 
                    <PokemonGalleryImage key={bench[key].ingame_id} card={bench[key]} ingameId={bench[key].ingame_id}/>	
                )}
        </DialogContent>
        <DialogActions>
            <Button onClick={setEnergyToPokemon} color="secondary">
                確定
            </Button>
        </DialogActions>
        </Dialog>
    );
}

export default FieldPokemonGallery;