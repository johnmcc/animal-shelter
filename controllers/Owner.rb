get "/owners" do
  @owners = Owner.all
  erb :"owner/index"
end