var basePrice = document.getElementById('booking_price').innerHTML;
var numberSlider = document.getElementById('booking_seats');
var priceField = document.getElementById('total_price');
var hiddenPriceField = document.getElementById('booking_total_price');

numberSlider.addEventListener('keydown', function(e) {
    e.preventDefault();
});

numberSlider.addEventListener('input', function(e) {
    priceField.innerHTML = numberSlider.value * basePrice;
    hiddenPriceField.value = numberSlider.value * basePrice;
});