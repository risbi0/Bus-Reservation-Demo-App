var dateDropdown = document.getElementById('filterrific_by_date');

for(let i = 1; i < dateDropdown.options.length; i++) {
    const convertedDate = new Date(dateDropdown.options[i].textContent);
    dateDropdown.options[i].textContent = moment(convertedDate).format('MM/DD/YYYY');
}