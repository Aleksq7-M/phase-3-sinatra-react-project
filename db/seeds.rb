puts "🌱 Seeding the timeline..."

Timeline.create(user: "Alex")

# Seed your database here

puts "🌱 Seeding events..."

Event.create(event_start: 986108400, event_end: 986191199, event_name: "Happy Birthday!", event_location: "Wherever you are", recurring: true)
Event.create(event_start: 987314400, event_end: 987400799, event_name: "Easter", event_location: "The general Christian sphere", recurring: true)

puts "✅ Done seeding!"
