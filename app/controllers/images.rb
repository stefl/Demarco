Demarco.controllers :images do

  get :index, :map => "/images" do
    render :"images/index"
  end

  get :year, :map => "/years/:decade/:year", :provides => [:html, :json] do
    @images = Image.where(:year => params[:year].to_i)
    @year = params[:year]
    @title = "Photographs from #{@year}"
    case content_type
    when :json
      @images.to_json
    when :html
      render :"images/year"
    end
  end

  get :show, :map => "/images/:catalogue_number", :provides => [:html, :json] do
    pass unless @image = Image.where(:catalogue_number => params[:catalogue_number]).first
    @title = @image.title_stripped
    case content_type
    when :json
      @image.to_json
    when :html
      render :"images/show"
    end
  end

  get :home, :map => "/" do
    render :"images/home"
  end

  get :search, :map =>"/search" do
    @images = Image.fulltext_search(params[:q].to_s)
    @title = "Search results for \"#{params[:q]}\""
    case content_type
    when :json
      @images.to_json
    when :html
      render :"images/index"
    end
  end

end
