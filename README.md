## README [WIP]

### Anchor Links
[Introduction](#introduction)\
[Prerequisites](#prerequisites)\
[Deployment Instructions](#deployment-instructions)\
[Services](#services)

### Introduction
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
 