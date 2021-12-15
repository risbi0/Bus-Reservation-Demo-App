var selectedSeats = document.getElementsByClassName('selected_seats');
var result;
var conversions = {
    'zero': 0,
    'one': 1,
    'two': 2,
    'three': 3,
    'four': 4,
    'five': 5,
    'six': 6,
    'seven': 7,
    'eight': 8,
    'nine': 9,
    'ten': 10,
    'eleven': 11,
    'twelve': 12,
    'thirteen': 13,
    'fourteen': 14,
    'fifteen': 15,
    'sixteen': 16,
    'seventeen': 17,
    'eighteen': 18,
    'nineteen': 19,
    'twenty': 20,
    'thirty': 30,
    'forty': 40
}

function convertToNumeral(i) {
    const append = conversions[i];
    if (append != null) result += append;
}

if (!selectedSeats[0].innerHTML.includes(',')) {
    for (let i = 0; i < selectedSeats.length; i++) {
        // spelled to numeral
        let array = selectedSeats[i].innerHTML.split(' ').map(function (s) {
            result = 0;
            s.toString().split(/[\s_]+/).forEach(convertToNumeral);
            return result;
        });
        // remove zeros
        array = array.filter(function(attr) {
            return attr != 0;
        });
        // sort ascending
        array = array.sort(function(a, b) {
            return a - b;
        });

        array = array.join(', ');

        selectedSeats[i].innerHTML = array;
    }
}