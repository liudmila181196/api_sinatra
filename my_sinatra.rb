# запросы API

require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'
module MyAppModule
 class App < Sinatra::Base

  register Sinatra::Namespace

  get '/' do
    'Hello My Sinatra - Easy and Wide world!'
  end

  get '/hello/:name' do
    "Sinatra приветствует тебя, #{params[:name]}!"
  end

  get %r{/hello/([\w]+)} do |c|
   "Hello, #{c}!"
  end

  get '/say/*/to/*' do
    params['splat'].to_s
  end

  get '/redirect' do
   redirect to('/hello/World')
  end

  #get '/download/*.*' do
  # a = params['splat'][0]
  #b = params['splat'][1]
  #[a, b]
  #end

  get '/download/*.*' do |path, ext|
   [path, ext] # => ["path/to/file", "xml"]
  end

  get '/jobs.?:format?' do
   # соответствует "GET /jobs", "GET /jobs.json", "GET /jobs.xml" и т.д.
   "Да, работает этот маршрут!"
  end

  namespace '/api/v1' do
   get '/*' do
    "I don't know what is the #{params[:splat]}. It's what you typed."
   end
  end

  get '/*' do
    "I don't know what is the #{params[:splat]}. It's what you typed."
  end
 end
end