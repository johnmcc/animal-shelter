require "sinatra"
require "sinatra/contrib/all"

require_relative "./models/Pet"
require_relative "./controllers/Pet"
require_relative "./controllers/Owner"
require_relative "./controllers/Search"

get "/" do
  @pets = Pet.all
  erb :index
end