import { strict as assert } from 'assert';
import myChecksum from './checksum';
import { readFileSync } from 'fs';
import * as path from 'path';

describe('run all tests for 01-general checksum', () => {
    it('1122 produces a sum of 3 ', () => {
        const cs = myChecksum('1122');
        assert.equal(cs, 3);
    });

    it('1111 produces 4', () => {
        const cs = myChecksum('1111');
        assert.equal(cs, 4);
    });

    it('91212129 produces 9 ', () => {
        const cs = myChecksum('91212129');
        assert.equal(cs, 9);
    });
});


describe('run client input for 01-general checksum', () => {
    it('big client input string produces a checksum of 1393', () => {
        const clientInput = getClientInput();
        const cs = myChecksum(clientInput);
        assert.equal(cs, 1393);
    });
});


function getClientInput(): string {
    return readFileSync(path.join(__dirname, "clientInput.txt"),'utf8');
}