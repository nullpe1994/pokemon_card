import React, { useContext } from 'react';
import { useRecoilState, useRecoilValue, useSetRecoilState} from 'recoil';
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

const FieldPokemonGallery = () => {
	const [open, setOpen] = React.useState(true);
	const [scroll, setScroll] = React.useState('paper');
    const battleField = useRecoilValue(battleFieldState);
    const bench = useRecoilValue(benchState);

    const [displayGiveEnergy, setDisplayGiveEnergy] = useRecoilState(displayGiveEnergyState);

	const handleClickOpen = (scrollType) => () => {
		setOpen(true);
		setScroll(scrollType);
	};

	const handleClose = () => {
		setOpen(false);
		if (displayGiveEnergy) setDisplayGiveEnergy(false);
	};

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
            scroll={scroll}
            aria-labelledby="scroll-dialog-title"
            aria-describedby="scroll-dialog-description"
        >
        <DialogTitle id="scroll-dialog-title">{'あなたのフィールドステータス'}</DialogTitle>
        <DialogContent dividers={scroll === 'paper'}>
            <DialogContentText> {'バトル場'} </DialogContentText>
                <PokemonGalleryImage card={battleField}/>
            <DialogContentText> {'ベンチ'} </DialogContentText>
                {Object.keys(bench).map(key => 
                    <PokemonGalleryImage card={bench[key]} index={key}/>	
                )}
        </DialogContent>
        <DialogActions>
            <Button onClick={handleClose} color="secondary">
                確定
            </Button>
        </DialogActions>
        </Dialog>
	);
}

export default FieldPokemonGallery;