import React, { useContext } from 'react';
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
import CardGalleryImage from '../atoms/cardImages/CardGalleryImage';
import choosenCardsState from '../State/choosenCardsState';
import UserNameContext from '../Context/UserNameContext';
import displayGalleryState from '../State/displayGalleryState';
import requireCostState from '../State/requireCostState';
import handOfIndexState from '../State/handOfIndexState';
import HandGalleryImage from '../atoms/cardImages/HandGalleryImage';
import countState from '../State/countState';
import cardNameState from '../State/cardNameState';

const CardGallery = (props) => {
	const [open, setOpen] = React.useState(true);
	const [scroll, setScroll] = React.useState('paper');
	const contentText = useRecoilValue(contentTextState);
	const [choosenCards, setChoosenCards] = useRecoilState(choosenCardsState);
	const [gallery, setGallery] = useRecoilState(galleryState);
	const userName = useContext(UserNameContext);
	const setDisplayGallery = useSetRecoilState(displayGalleryState);
	const [requireCost, setRequireCost] = useRecoilState(requireCostState);
	const handOfIndex = useRecoilValue(handOfIndexState);
	const setCount = useSetRecoilState(countState);
	const cardName = useRecoilValue(cardNameState);

	const handleClickOpen = (scrollType) => () => {
		setOpen(true);
		setScroll(scrollType);
	};

	const handleClose = () => {
		setOpen(false);
		if (requireCost) setRequireCost(false);
	};

	const requestSearch = () => {
		if (requireCost) {
			let index = handOfIndex;
			let payCostIndex = choosenCards[0];
			if (choosenCards.length > 0) {
				if (payCostIndex >= handOfIndex) payCostIndex++;
				window.socket.emit('requireCost', {
					yourId: userName.yourId,
					oppId: userName.oppId,
					cardName: cardName,
					index: payCostIndex
				});
				if (choosenCards[0] < index) index--;
				window.socket.emit('useSpellCard', {
					yourId: userName.yourId,
					oppId: userName.oppId,
					index: index
				});
			}
			setRequireCost(false);
		} else {
			window.socket.emit('searchCardsFromDeck', {
				yourId: userName.yourId,
				oppId: userName.oppId,
				getCards: choosenCards,
			});
			setOpen(false);
			setDisplayGallery(false);
		}
		setGallery([]);
		setChoosenCards([]);
		setCount(0);
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
		<div>
			{!requireCost && (
				<AcceptButton 
					isCorrect={handleClickOpen('paper')}
					name={'デッキ'}
				/>
			)}
			<Dialog
				open={open}
				fullWidth={true}
				maxWidth={'md'}
				onClose={handleClose}
				scroll={scroll}
				aria-labelledby="scroll-dialog-title"
				aria-describedby="scroll-dialog-description"
			>
			<DialogTitle id="scroll-dialog-title">{props.title}</DialogTitle>
			<DialogContent dividers={scroll === 'paper'}>
				<DialogContentText> {contentText} </DialogContentText>
				{!requireCost && (
					Object.keys(gallery).map(key => 
						<CardGalleryImage card={gallery[key]} index={key}/>	
					)
				)}
				{requireCost && (
					Object.keys(gallery).map(key => 
						<HandGalleryImage card={gallery[key]} index={key}/>	
					)
				)}
			</DialogContent>
			<DialogActions>
			{!requireCost && (
				<Button onClick={handleClose} color="secondary">
					フィールドを見る
				</Button>
			)}
				<Button onClick={requestSearch} color="secondary">
					確定
				</Button>
			</DialogActions>
			</Dialog>
		</div>
	);
}

export default CardGallery;