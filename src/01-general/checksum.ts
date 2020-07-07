
// data has to be a string of numbers
const checksum = (data: string) => {
    var total = 0;
    for(var i=1; i<data.length; i++) {
        if (data[i] === data[i-1]) {
            total = total + Number(data[i]);
        }
    }
    // check first and last
    if(data[0] === data[data.length-1]) {
        total = total + Number(data[0]);
    }
    return total;
}

export default checksum;