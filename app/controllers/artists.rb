Demarco.controllers :artists do

  get :index, :map => "/artists" do
    redirect "/"
  end

  get :show, :map => "/artists/:slug", :provides => [:html, :json] do
    not_found unless @artist = Artist.where(:slug => params[:slug]).first
    @images = @artist.images
    case content_type
    when :json
      @images.to_json
    when :html
      render :"images/artist"
    end
  end
  
end
