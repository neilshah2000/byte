import muChecksum from '../src/01-general/checksum';
import assert  from 'assert';
import myChecksum from '../src/01-general/checksum'

describe('run all tests', () => {
    it('1122 produces a sum of 3 ', () => {
        const cs = myChecksum('1122');
        assert.equal(cs, 3);
    });
});
