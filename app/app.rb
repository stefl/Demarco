class Demarco < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Sprockets

  sprockets

  enable :sessions
  
  configure :development do
    ENV['SEARCHIFY_API_URL'] = "http://:2eadfBpOvNb7nX@uyux.api.searchify.com"
    #ENV['SEARCHIFY_API_URL'] = "http://:2AlIk6jDAewlon@dzpbu.api.searchify.com"
  end

end
