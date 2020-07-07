import { strict as assert } from 'assert';
import mySpreadsheetChecksum from './spreadsheetChecksum';
import { readFileSync } from 'fs';
import * as path from 'path';

describe('run all tests for 02-general spreadsheet checksum', () => {
    it('test input produces a sum of 18', () => {
        const testInput = `5	1	9	5
7	5	3
2	4	6	8`;
        const sscs = mySpreadsheetChecksum(testInput);
        assert.equal(sscs, 18);
    });

});


describe('run client input for 01-general checksum', () => {
    it('big client input string produces a checksum of 32121', () => {
        const clientInput = getClientInput();
        const sscs = mySpreadsheetChecksum(clientInput);
        assert.equal(sscs, 32121);
    });
});


function getClientInput(): string {
    return readFileSync(path.join(__dirname, "02-general.tsv"),'utf8');
}