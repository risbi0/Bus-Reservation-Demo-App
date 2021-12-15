var seats = document.querySelectorAll('input[type="checkbox"]');

for (let i = 0; i < seats.length; i++) {
    seats[i].onclick = function() {
        return false;
    }
}
function prepend(str) {
    return 'seating_' + str;
}
var selectedSeats = document.getElementsByName('seats')[0].defaultValue.split(' ').map(prepend);
// highlight selected seats on viewing
for (let i = 0; i < selectedSeats.length; i++) {
    for (let j = 0; j < seats.length; j++) {
        if (selectedSeats[i] == seats[j].id) {
            [seats[j].disabled, seats[j].checked] = [false, true];
        }
    }
}