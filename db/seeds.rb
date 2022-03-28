# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding...'

puts 'Deleting old records...'

Booking.delete_all
Seating.delete_all
Schedule.delete_all

puts 'Populating Schedule model...'

start = Process.clock_gettime(Process::CLOCK_MONOTONIC)

STATIONS = ['Manila', 'Baguio', 'Baler', 'Malivares', 'Balanga', 'San Fernando', 'Cabanatuan', 'San Jose']
TIMES = Array.new(96) { |i = 1| (Time.new(0, 1, 1) + i * 15.minutes).strftime('%H:%M') }
START_DATE = Date.parse('2030-01-01')
ctr = 0

15.times do |i|
    for departure in STATIONS do
        for destination in STATIONS do
            if departure != destination
                price = 600 if (departure == "Manila" && destination == "Baguio") || (departure == "Baguio" && destination == "Manila")
                price = 488 if (departure == "Manila" && destination == "Baler") || (departure == "Baler" && destination == "Manila")
                price = 315 if (departure == "Manila" && destination == "Malivares") || (departure == "Malivares" && destination == "Manila")
                price = 229 if (departure == "Manila" && destination == "Balanga") || (departure == "Balanga" && destination == "Manila")
                price = 220 if (departure == "Manila" && destination == "San Fernando") || (departure == "San Fernando" && destination == "Manila")
                price = 271 if (departure == "Manila" && destination == "Cabanatuan") || (departure == "Cabanatuan" && destination == "Manila")
                price = 370 if (departure == "Manila" && destination == "San Jose") || (departure == "San Jose" && destination == "Manila")
                price = 400 if (departure == "Baguio" && destination == "Baler") || (departure == "Baler" && destination == "Baguio")
                price = 522 if (departure == "Baguio" && destination == "Malivares") || (departure == "Malivares" && destination == "Baguio")
                price = 600 if (departure == "Baguio" && destination == "Balanga") || (departure == "Balanga" && destination == "Baguio")
                price = 500 if (departure == "Baguio" && destination == "San Fernando") || (departure == "San Fernando" && destination == "Baguio")
                price = 480 if (departure == "Baguio" && destination == "Cabanatuan") || (departure == "Cabanatuan" && destination == "Baguio")
                price = 784 if (departure == "Baguio" && destination == "San Jose") || (departure == "San Jose" && destination == "Baguio")
                price = 773 if (departure == "Baler" && destination == "Malivares") || (departure == "Malivares" && destination == "Baler")
                price = 723 if (departure == "Baler" && destination == "Balanga") || (departure == "Balanga" && destination == "Baler")
                price = 710 if (departure == "Baler" && destination == "San Fernando") || (departure == "San Fernando" && destination == "Baler")
                price = 250 if (departure == "Baler" && destination == "Cabanatuan") || (departure == "Cabanatuan" && destination == "Baler")
                price = 480 if (departure == "Baler" && destination == "San Jose") || (departure == "San Jose" && destination == "Baler")
                price = 180 if (departure == "Malivares" && destination == "Balanga") || (departure == "Balanga" && destination == "Malivares")
                price = 350 if (departure == "Malivares" && destination == "San Fernando") || (departure == "San Fernando" && destination == "Malivares")
                price = 300 if (departure == "Malivares" && destination == "Cabanatuan") || (departure == "Cabanatuan" && destination == "Malivares")
                price = 600 if (departure == "Malivares" && destination == "San Jose") || (departure == "San Jose" && destination == "Malivares")
                price = 130 if (departure == "Balanga" && destination == "San Fernando") || (departure == "San Fernando" && destination == "Balanga")
                price = 287 if (departure == "Balanga" && destination == "Cabanatuan") || (departure == "Cabanatuan" && destination == "Balanga")
                price = 465 if (departure == "Balanga" && destination == "San Jose") || (departure == "San Jose" && destination == "Balanga")
                price = 330 if (departure == "San Fernando" && destination == "Cabanatuan") || (departure == "Cabanatuan" && destination == "San Fernando")
                price = 365 if (departure == "San Fernando" && destination == "San Jose") || (departure == "San Jose" && destination == "San Fernando")
                price = 345 if (departure == "Cabanatuan" && destination == "San Jose") || (departure == "San Jose" && destination == "Cabanatuan")
                ctr += 1
                Schedule.create(departure: departure, destination: destination, date: START_DATE + i, time: TIMES.sample, seats_available: 47, price: price).update_column(:id, ctr)
            end
        end
    end
end

finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
diff = finish - start
time_took = Time.at(diff).utc.strftime("%-M minute/s\n%-S seconds")

puts 'Done. Time took:'
puts time_took

puts 'Populating Seating model...'

start = Process.clock_gettime(Process::CLOCK_MONOTONIC)

Schedule.count.times do |i|
    Seating.create(schedule_id: i + 1,  one: true, two: true, three: true, four: true, five: true, six: true, seven: true, eight: true, nine: true, ten: true,
        eleven: true, twelve: true, thirteen: true, fourteen: true, fifteen: true, sixteen: true, seventeen: true, eighteen: true, nineteen: true, twenty: true,
        twenty_one: true, twenty_two: true, twenty_three: true, twenty_four: true, twenty_five: true, twenty_six: true, twenty_seven: true, twenty_eight: true, twenty_nine: true, thirty: true,
        thirty_one: true, thirty_two: true, thirty_three: true, thirty_four: true, thirty_five: true, thirty_six: true, thirty_seven: true, thirty_eight: true, thirty_nine: true,forty: true,
        forty_one: true, forty_two: true, forty_three: true, forty_four: true, forty_five: true, forty_six: true, forty_seven: true).update_column(:id, i + 1)
end

finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
diff = finish - start
time_took = Time.at(diff).utc.strftime("%-M minute/s\n%-S seconds")

puts 'Done. Time took:'
puts time_took

puts 'Seeding done.'