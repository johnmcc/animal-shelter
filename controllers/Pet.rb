get "/pets/:id" do
  @pet = Pet.find params[:id].to_i
  erb :"pet/show"
end

post "/pets/:id/toggle_adoptability" do
  pet_id = params[:id]
  pet = Pet.find(pet_id.to_i)

  pet.toggle_adoptability
  redirect to "/pets/#{pet_id}"
end