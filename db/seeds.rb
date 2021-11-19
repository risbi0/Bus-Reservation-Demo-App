# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding..."

Schedule.create(departure: 'Manila', destination: 'Quezon City', date_time: '2021-12-21 12:30', seats_available: 45, price: 120)
Schedule.create(departure: 'Pateros', destination: 'Pasig City', date_time: '2021-12-22 13:20', seats_available: 45, price: 80)
Schedule.create(departure: 'Makati City', destination: 'Taguig City', date_time: '2021-12-25 14:45', seats_available: 45, price: 90)
Schedule.create(departure: 'Manila', destination: 'Pasig City', date_time: '2021-12-27 11:00', seats_available: 45, price: 100)
Schedule.create(departure: 'Marikina City', destination: 'Makati City', date_time: '2021-12-23 10:00', seats_available: 40, price: 100)
Schedule.create(departure: 'Makati City', destination: 'Taguig City', date_time: '2021-12-23 04:00', seats_available: 40, price: 70)
Schedule.create(departure: 'Quezon City', destination: 'Manila', date_time: '2021-12-25 13:00', seats_available: 40, price: 60)
Schedule.create(departure: 'Quezon City', destination: 'Makati City', date_time: '2021-12-26 18:00', seats_available: 40, price: 130)
Schedule.create(departure: 'Quezon City', destination: 'Marikina City', date_time: '2021-12-28 08:00', seats_available: 35, price: 150)
Schedule.create(departure: 'Manila', destination: 'Marikina City', date_time: '2021-12-31 08:30', seats_available: 35, price: 85)
Schedule.create(departure: 'Pasig City', destination: 'Manila', date_time: '2021-12-28 20:10', seats_available: 35, price: 95)
Schedule.create(departure: 'Pateros', destination: 'Manila', date_time: '2021-12-31 23:45', seats_available: 35, price: 130)
Schedule.create(departure: 'Pasig City', destination: 'Quezon City', date_time: '2021-11-16 23:45', seats_available: 35, price: 150)
Schedule.create(departure: 'Makati City', destination: 'Manila', date_time: '2021-11-15 23:45', seats_available: 35, price: 140)
Schedule.create(departure: 'Manila', destination: 'Pasig City', date_time: '2021-11-14 23:45', seats_available: 35, price: 170)

puts "Seeding done."