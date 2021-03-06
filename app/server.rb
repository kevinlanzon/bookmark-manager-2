require 'sinatra'
require 'data_mapper'
require 'rack-flash'
require 'sinatra/partial'
require_relative 'models/link'
require_relative 'models/tag'
require_relative 'models/user'
require_relative 'helpers/application'



class BookmarkManager < Sinatra::Base

require_relative 'data_mapper_setup'

  include BookMarkUtils

  enable :sessions
  set :session_secret, 'super secret'
  use Rack::Flash
  use Rack::MethodOverride
  register Sinatra::Partial
  set :partial_template_engine, :erb
  set :views, Proc.new { File.join("./app/views") }
  set :public_folder, Proc.new { File.join(root, "..", "public") }


  run! if app_file == $0

end

require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/links'
require_relative 'controllers/tags'
require_relative 'controllers/application'