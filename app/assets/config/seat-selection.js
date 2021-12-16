var selectLimit = parseInt(document.getElementById('seating_limit').value);
var seats = document.querySelectorAll('input[type="checkbox"]');
var seatsSelected = document.getElementById('seating_selected_seats');

for (let i = 0; i < seats.length; i++) {
    seats[i].onclick = function() {
        // prevent selecting more seats
        const selectedSeats = document.querySelectorAll('input[type="checkbox"]:checked').length;
        if (selectedSeats > selectLimit) return false;
        
        const seatNumber = seats[i].id.substring('seating_'.indexOf('_') + 1);
        // add or remove seat values
        if (seats[i].checked) {
            seatsSelected.value = seatsSelected.value + ' ' + seatNumber;
        } else {
            const arr = seatsSelected.value.split(' ');
            for (let i = 0; i < arr.length; i++) {
                if (arr[i] == seatNumber) {
                    arr.splice(i, 1);
                }
            }
            seatsSelected.value = arr.join(' ');
        }
        seatsSelected.value = seatsSelected.value.replace(/\s+/g,' ').trim();
    }
}