require_relative "../models/PetType"

get "/search" do
  @types = PetType.all
  @params = params

  if params[:type_id] != nil
    availability = params[:availability] == "on"
    @pets = Pet.search params[:type_id], availability
  end
  erb :"search/index"
end