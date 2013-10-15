if Rails.env.development?
  ApiTaster.routes do
    desc 'Get a __list__ of users'
    get '/achievements'

  end
end

