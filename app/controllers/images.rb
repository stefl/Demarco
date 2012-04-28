Demarco.controllers :images do

  get :index, :map => "/images" do
    render :"images/index"
  end

  get :year, :map => "/years/:decade/:year" do
    @images = Image.where(:year => params[:year].to_i)
    @year = params[:year]
    render :"images/year"
  end
  
  get :artist, :map => "/artists/:name" do
    @images = Image.where(:title => /#{params[:name].humanize}/ )
    render :"images/artist"
  end

  get :home, :map => "/" do
    render :"images/home"
  end

end
