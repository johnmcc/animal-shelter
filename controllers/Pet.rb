get "/pets/available" do
  @pets = Pet.available
  erb :index
end

get "/pets/:id" do
  @pet = Pet.find(params[:id].to_i)
  @owners = Owner.all
  erb :"pet/show"
end

post "/pets/:id/update" do
  Pet.new(params).update
  redirect to "/pets/#{params[:id]}"
end