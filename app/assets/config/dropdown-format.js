var dateDropdown = document.getElementById('filterrific_by_date').options;

for (let i = 1; i < dateDropdown.length; i++) {
    const convertedDate = new Date(dateDropdown[i].textContent);
    dateDropdown[i].textContent = moment(convertedDate).format('MM/DD/YYYY');
}