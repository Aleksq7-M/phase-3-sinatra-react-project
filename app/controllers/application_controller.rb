require 'pry'
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/users"  do
    User.all.to_json
  end

  get "/m/:dd/:mm/:yyyy/:user_id" do
    # events = Event.month(year: params[:yyyy].to_i, month: params[:mm].to_i)
    # events.to_json
    events = User.find(params[:user_id]).events_range(range: 'm', year: params[:yyyy], month: params[:mm], day: params[:dd])
    # events.merge(User.first.events_range(range: 'm', year: params[:yyyy], month: params[:mm], day: params[:dd]))
    events.to_json
  end

  post '/events' do
    # binding.pry
    new_event = Event.create(
      event_start: params[:event_start],
      event_end: params[:event_end],
      event_name: params[:event_name],
      event_location: params[:event_location],
      recurring: params[:recurring],
      user_id: params[:user_id]
    )

    new_event.to_json
  end

  post "/users" do 
    new_user = User.create(
      username: params[:username],
      password: params[:password]
    )

    new_user.to_json
  end

  patch "/events/:id" do
    event = Event.find(params[:id])
    event.update(
      event_start: params[:event_start],
      event_end: params[:event_end],
      event_name: params[:event_name],
      event_location: params[:event_location],
      recurring: params[:recurring]
    )
  end

  delete "events/:id" do 
    event = Event.find(params[:id])
    event.destroy

    event.to_json
  end

end
