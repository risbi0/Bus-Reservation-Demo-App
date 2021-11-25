# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seeding..."

Booking.delete_all
Schedule.delete_all
Seating.delete_all

Schedule.create(departure: 'Manila', destination: 'Quezon City', date: '2021-12-21', time: '12:30', seats_available: 47, price: 120).update_column(:id, 1)
Schedule.create(departure: 'Pateros', destination: 'Pasig City', date: '2021-12-22', time: '13:20', seats_available: 47, price: 80).update_column(:id, 2)
Schedule.create(departure: 'Makati City', destination: 'Taguig City', date: '2021-12-25', time: '14:45', seats_available: 47, price: 90).update_column(:id, 3)
Schedule.create(departure: 'Manila', destination: 'Pasig City', date: '2021-12-27', time: '11:00', seats_available: 47, price: 100).update_column(:id, 4)
Schedule.create(departure: 'Marikina City', destination: 'Makati City', date: '2021-12-23', time: '10:00', seats_available: 47, price: 100).update_column(:id, 5)
Schedule.create(departure: 'Makati City', destination: 'Taguig City', date: '2021-12-23', time: '04:00', seats_available: 47, price: 70).update_column(:id, 6)
Schedule.create(departure: 'Quezon City', destination: 'Manila', date: '2021-12-25', time: '13:00', seats_available: 47, price: 60).update_column(:id, 7)
Schedule.create(departure: 'Quezon City', destination: 'Makati City', date: '2021-12-26', time: '18:00', seats_available: 47, price: 130).update_column(:id, 8)
Schedule.create(departure: 'Quezon City', destination: 'Marikina City', date: '2021-12-28', time: '08:00', seats_available: 47, price: 150).update_column(:id, 9)
Schedule.create(departure: 'Manila', destination: 'Marikina City', date: '2021-12-31', time: '08:30', seats_available: 47, price: 85).update_column(:id, 10)
Schedule.create(departure: 'Pasig City', destination: 'Manila', date: '2021-12-28', time: '20:10', seats_available: 47, price: 95).update_column(:id, 11)
Schedule.create(departure: 'Pateros', destination: 'Manila', date: '2021-12-31', time: '23:45', seats_available: 47, price: 130).update_column(:id, 12)
Schedule.create(departure: 'Pasig City', destination: 'Quezon City', date: '2021-11-16', time: '23:45', seats_available: 47, price: 150).update_column(:id, 13)
Schedule.create(departure: 'Makati City', destination: 'Manila', date: '2021-11-15', time: '23:45', seats_available: 47, price: 140).update_column(:id, 14)
Schedule.create(departure: 'Manila', destination: 'Pasig City', date: '2021-11-14', time: '23:45', seats_available: 47, price: 170).update_column(:id, 15)

15.times { |i|
    Seating.create(schedule_id: i + 1,  one: true, two: true, three: true, four: true, five: true, six: true, seven: true, eight: true, nine: true, ten: true,
        eleven: true, twelve: true, thirteen: true, fourteen: true, fifteen: true, sixteen: true, seventeen: true, eighteen: true, nineteen: true, twenty: true,
        twenty_one: true, twenty_two: true, twenty_three: true, twenty_four: true, twenty_five: true, twenty_six: true, twenty_seven: true, twenty_eight: true, twenty_nine: true, thirty: true,
        thirty_one: true, thirty_two: true, thirty_three: true, thirty_four: true, thirty_five: true, thirty_six: true, thirty_seven: true, thirty_eight: true, thirty_nine: true,forty: true,
        forty_one: true, forty_two: true, forty_three: true, forty_four: true, forty_five: true, forty_six: true, forty_seven: true)
}

puts "Seeding done."