class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/m/:dd/:mm/:yyyy" do
    events = Event.month(year: params[:yyyy].to_i, month: params[:mm].to_i)
    events.to_json
  end

end
