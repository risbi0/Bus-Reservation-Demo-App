## J-STAR Bus Reservations

### Anchor Links
[Introduction](#introduction)\
[Prerequisites](#prerequisites)\
[Deployment Instructions](#deployment-instructions)\
[Services](#services)

### Introduction
The J-STAR Bus Reservations app is a project made for my 3rd year Computer Science course, Human Computer Interaction.

**Important note:** This app is for demonstration purposes only. J-STAR and its services don't exist in real life. The bank account details posted in the site is fake.

This application is built and supported by:
* [Rails 6](https://rubyonrails.org/) - server-side web application framework written in Ruby
* [Bootstrap 5](https://getbootstrap.com/) - CSS framework
* [Heroku](https://www.heroku.com/) - cloud platform as a service
### Prerequisites
If you want to deploy this application locally in your machine, these are the required softwares:
* [Git](https://git-scm.com/) - version control system
* [Ruby](https://www.ruby-lang.org/en/) - interpreted, high-level programming language
* [SQLite](https://www.sqlite.org/) - relational database management system
* [Node.js](https://nodejs.org/) - Javascript runtime environment
* [Yarn](https://classic.yarnpkg.com/en/) - Javascript package manager
### Deployment Instructions
Clone the repository:
```
git clone https://github.com/teduniq/bus_app.git
``` 
Move into the directory. Tell `Bundler` to ignore `:production` group gems:
```
bundle config set --local without production
```
Install the gems:
```
bundle install
```
Install the dependencies:
```
yarn install
```
Run migrations:
```
rails db:migrate
```
Load the seed data:
```
rails db:seed
```
Start the server:
```
rails server
```
Go to `localhost:3000` in your browser to check out the application.
### Services
There are 2 main users that has different functions from each other - the users that use the services itself and the admin.
#### User Side
As soon as the site loads, visitors can see all the available trips placed in a table. The trips can be filtered by departure, destination, date, and be sorted by the aforementioned categories. Visitors need to log in in order to book a trip, concerning this they can make an account. Details needed are: email (doesn't need to be a real email since a mailer is't used here), name, and password. Users can edit their password and delete their account.

Travel schedules have the following details: trip number, departure, destination, date, time, available seats, and price (per passenger). Every schedule has a bus with a seat capacity of 47. Schedules that are full (available seats are 0) and its departure date that's 2 days away are filtered from view for the users.

Each booking allows up to 5 people at a time. A 10-length uppercased hexadecimal string is randomly generated on booking, which will be the confirmation code. After booking, the users can choose one of two payment methods - on-site or bank payment. For on-site payment the users will go to the nearest station and pay there. For bank payment the users pay either by going to a bank or via online banking transaction, and filling a form with the transaction details. After doing either methods the users should wait for the admin to approve the bookings.

When the booking is approved, the users can now reserve their seats. Seats already reserved by other users are marked and disabled. They can only choose as many as they booked, no more no less. After reserving they can check back which seats they selected. There is no option of redoing their selections.
#### Admin Side
Admin account details:

Email: `admin@example.com`

Password: `123`

The admins are the people on the company's side. They can make schedules, approve bookings, check and edit the form for the users that use the bank payment option, and see the details of every schedule, including the passengers details, their confirmation code, seats selected, and the seat plan.

Admins don't have access to the profile, can't book and choose seats.

Note: The Google Form link won't be available to any person aside from the ones in my group since it's restricted by Google accounts. These people (already logged in as admin) can only see a normal form that the normal user also sees. The Google Sheets link will only be in view-mode as well.