Demarco.controllers :images do

  get :index, :map => "/images" do
    render :"images/index"
  end

  get :year, :map => "/years/:decade/:year" do
    @images = Image.where(:year => params[:year].to_i)
    @year = params[:year]
    render :"images/year"
  end

  get :home, :map => "/" do
    render :"images/home"
  end

  get :search, :map =>"/search" do
    @images = Image.fulltext_search(params[:q].to_s)
    @title = "Search results for \"#{params[:q]}\""
    render :"images/index"
  end

end
