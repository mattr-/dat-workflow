module DatWorkflow
  class App < ::Sinatra::Base
    enable :sessions

    set :github_options, {
      :secret => ENV["GITHUB_CLIENT_SECRET"],
      :client_id => ENV["GITHUB_CLIENT_ID"]
    }

    register Sinatra::Auth::Github

    get "/" do
      authenticate!
      "Hello there, #{github_user.login}"
    end
  end
end
