import React, { useEffect, useState} from 'react';
import Badge from '@material-ui/core/Badge';
import EnergyIcon from '../atoms/EnergyIcon';
import colorlessIcon from '../../image/typeIcons/colorlessIcon.png';
import darknessIcon from '../../image/typeIcons/darknessIcon.png';
import dragonIcon from '../../image/typeIcons/dragonIcon.png';
import fairyIcon from '../../image/typeIcons/fairyIcon.png';
import fightingIcon from '../../image/typeIcons/fightingIcon.png';
import grassIcon from '../../image/typeIcons/grassIcon.png';
import lightningIcon from '../../image/typeIcons/lightningIcon.png';
import metalIcon from '../../image/typeIcons/metalIcon.png';
import psychicIcon from '../../image/typeIcons/psychicIcon.png';
import waterIcon from '../../image/typeIcons/waterIcon.png';
import waterFightingIcon from '../../image/typeIcons/waterFightingIcon.png';
import energyAndToolState from '../State/energyAndToolState';
import { useRecoilValue } from 'recoil';
import phaseState from '../State/phaseState';

const typeIcons = {
    colorless: {
        color: 'primary',
        children: <EnergyIcon icon={colorlessIcon}/>,
    },
    darkness: {
        color: 'primary',
        children: <EnergyIcon icon={darknessIcon}/>,
    },
    dragon: {
        color: 'primary',
        children: <EnergyIcon icon={dragonIcon}/>,
    },
    fairy: {
        color: 'primary',
        children: <EnergyIcon icon={fairyIcon}/>,
    },
    fighting: {
        color: 'primary',
        children: <EnergyIcon icon={fightingIcon}/>,
    },
    grass: {
        color: 'primary',
        children: <EnergyIcon icon={grassIcon}/>,
    },
    lightning: {
        color: 'primary',
        children: <EnergyIcon icon={lightningIcon}/>,
    },
    metal: {
        color: 'primary',
        children: <EnergyIcon icon={metalIcon}/>,
    },
    psychic: {
        color: 'primary',
        children: <EnergyIcon icon={psychicIcon}/>,
    },
    water: {
        color: 'primary',
        children: <EnergyIcon icon={waterIcon}/>,
    },
    waterFighting: {
        color: 'primary',
        children: <EnergyIcon icon={waterFightingIcon}/>,
    },
};

const EnergyBadge = (props) => {
    const energyAndTool = useRecoilValue(energyAndToolState);
    const ingameId = energyAndTool[`${props.ingameId}`];
    return (
        <div>
            {(ingameId !== undefined && ingameId.energyCnt.colorless > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.colorless} max={99} {...typeIcons.colorless} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.darkness > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.darkness} max={99} {...typeIcons.darkness} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.dragon > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.dragon} max={99} {...typeIcons.dragon} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }} 
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.fairy > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.fairy} max={99} {...typeIcons.fairy} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.fighting > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.fighting} max={99} {...typeIcons.fighting} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.grass > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.grass} max={99} {...typeIcons.grass} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.lightning > 0) && (
            <Badge
                badgeContent={ingameId.energyCnt.lightning} max={99} {...typeIcons.lightning} display='block'
                anchorOrigin={{
                    vertical: 'top',
                    horizontal: 'right',
                }}
            />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.metal > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.metal} max={99} {...typeIcons.metal} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.psychic > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.psychic} max={99} {...typeIcons.psychic} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.water > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.water} max={99} {...typeIcons.water} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
            {(ingameId !== undefined && ingameId.energyCnt.rapidStrikeEnergy > 0) && (
                <Badge
                    badgeContent={ingameId.energyCnt.rapidStrikeEnergy} max={99} {...typeIcons.waterFighting} display='block'
                    anchorOrigin={{
                        vertical: 'top',
                        horizontal: 'right',
                    }}
                />
            )}
        </div>
    );
}

export default EnergyBadge;