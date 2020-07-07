
// data has to be a string of numbers
const spreadsheetChecksum = (data: string) => {
    const lines = data.split('\n')
    var total = 0;
    lines.forEach((line) => {
        const nums = line.split('\t');
        nums.sort((a, b) => {return Number(a) - Number(b)})
        const diff = Number(nums[nums.length-1]) - Number(nums[0])
        total = total + diff
    });
    return total;
}

export default spreadsheetChecksum;