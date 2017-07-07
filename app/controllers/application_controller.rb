require './config/environment'
require './app/models/scheduler_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end
  
  post '/results' do
    date = params[:date]
    
    unix_time = to_unix_time(date)
    @minutes_left = time_to_go(unix_time)
    @day_hr_min_left = hrs_mins_to_go(@minutes_left)
    #hr_min_left[0] is the hours and hr_min_left[1] is the minutes
    erb :results 
  end  
  
end
