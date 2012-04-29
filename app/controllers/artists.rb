Demarco.controllers :artists do

  get :index, :map => "/artists" do
    redirect "/"
  end

  get :show, :map => "/artists/:slug" do
    not_found unless @artist = Artist.where(:slug => params[:slug]).first
    @images = @artist.images
    render :"images/artist"
  end
  
end
