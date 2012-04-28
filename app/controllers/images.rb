Demarco.controllers :images do

  get :index, :map => "/images" do
    render :"images/index"
  end

  get :year, :map => "/years/:year" do
    @images = Image.where(:year => params[:year].to_i)
    render :"images/index"
  end
  
  get :artist, :map => "/artists/:name" do
    @images = Image.where(:title => /#{params[:name]}/i )
    render :"images/artist"
  end

  get :home, :map => "/" do
    render :"images/home"
  end

end
