require_relative 'config/environment'
require_relative 'models/piglatinizer'
class App < Sinatra::Base
  get '/' do
    erb :user_input
  end
  
  post '/' do 
    inputfu = params[:user_phrase]
    newpig = PigLatinizer.new
    @user_phrase = newpig.piglatinize(inputfu)
    erb :converter_output
  end
end