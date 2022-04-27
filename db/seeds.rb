require 'rest-client';
require 'pry';
require 'date';
require 'time';
puts "🌱 Seeding the Universal User"

User.create(
    username: "Dev",
    password: "elopment"
)

User.create(
    username:"Alex",
    password:"n0ne_lol"
)

# Seed your database here

puts "🌱 Seeding events..."

response = RestClient.get "https://calendarific.com/api/v2/holidays?&api_key=9f02a2cda149ea1d8dc0f4b8b06993a961713474&country=US&year=2001"

holiday_array =  JSON.parse(response)["response"]["holidays"]

holiday_array.each do |holiday|

    date = holiday["date"]["datetime"]

    event_start=Time.new(date["year"], date["month"], date["day"],0,0,0,"+00:00").to_i

    puts event_start

    Event.create(
        event_start: event_start,
        event_end: event_start + 86399,
        event_name: holiday["name"],
        event_location: holiday["country"]["name"],
        recurring: true,
        user_id: User.first.id
    )
end 

Event.create(event_start: 986083200, event_end: 986169599, event_name: "Happy Birthday!", event_location: "Wherever you are", recurring: true, user_id: User.first.id)
Event.create(event_start: 987292800, event_end: 987379199, event_name: "Easter", event_location: "The general Christian sphere", recurring: true, user_id: User.first.id)
Event.create(event_start: 986342400, event_end: 986428799, event_name: "The First Wednesday of April 2001", event_location: "The entire universe", recurring: false, user_id: User.first.id)
Event.create(
    event_start: 986256000,
    event_end: 986256001,
    event_name: "Test Event From the Future",
    event_location: "Nowhere",
    recurring: false,
    user_id: User.second.id
)

puts "✅ Done seeding!"
