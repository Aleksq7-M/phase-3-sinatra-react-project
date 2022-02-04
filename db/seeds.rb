puts "🌱 Seeding the timeline..."

Timeline.create(user: "Alex")

# Seed your database here

puts "🌱 Seeding events..."

Event.create(event_start: 986083200, event_end: 986169599, event_name: "Happy Birthday!", event_location: "Wherever you are", recurring: true, timeline_id: Timeline.first.id)
Event.create(event_start: 987292800, event_end: 987379199, event_name: "Easter", event_location: "The general Christian sphere", recurring: true, timeline_id: Timeline.first.id)
Event.create(event_start: 986342400, event_end: 986428799, event_name: "The First Wednesday of April 2001", event_location: "The entire universe", recurring: false, timeline_id: Timeline.first.id)

puts "✅ Done seeding!"
