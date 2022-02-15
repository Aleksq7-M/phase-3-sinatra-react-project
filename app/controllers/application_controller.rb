class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/m/:dd/:mm/:yyyy/:user_id" do
    # events = Event.month(year: params[:yyyy].to_i, month: params[:mm].to_i)
    # events.to_json
    events = User.find(params[:user_id]).events_range(range: 'm', year: params[:yyyy], month: params[:mm], day: params[:dd])
    # events.merge(User.first.events_range(range: 'm', year: params[:yyyy], month: params[:mm], day: params[:dd]))
    events.to_json
  end

end
