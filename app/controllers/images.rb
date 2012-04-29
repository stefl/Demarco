Demarco.controllers :images do

  get :index, :map => "/images" do
    render :"images/index"
  end

  get :year, :map => "/years/:decade/:year" do
    @images = Image.where(:year => params[:year].to_i)
    @year = params[:year]
    @title = "Photographs from #{@year}"
    render :"images/year"
  end

  get :show, :map => "/images/:catalogue_number" do
    not_found unless @image = Image.where(:catalogue_number => params[:catalogue_number]).first
    @title = @image.title
    render :"images/show"
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
