import {atom} from 'recoil';

const energySwitchState = atom ({
    key: 'energySwitch',
    default: false,
});

export default energySwitchState;