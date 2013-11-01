require 'rubygems'
require 'sinatra'
require 'json'

require_relative 'models'
require_relative 'helpers'

enable :sessions

set :public_folder, 'public'

=begin
before '/app/*' do
  if !session['user']
    if request.xhr?
      redirect '/403'
    else
      redirect '/login'
    end
  end
end
=end

get '/403' do
  status 403
end

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  session['user'] = Nil
  redirect '/app/'
end

get '/logout' do
  session['user'] = Nil
  redirect '/'
end

get '/app/' do
  erb :home
end

get '/app/categories' do
  content_type 'application/json'
  @categories = Category.asc(:name)
  { :success => true, :total => @categories.size, :data => @categories }.to_json
end

get '/app/transactions' do
  content_type 'application/json'
  @transactions = Transaction.where(:date.gte => Date.parse('2013-10-01'), :date.lte => Date.parse('2013-10-31')).asc(:date)
  { :success => true, :total => @transactions.size, :data => @transactions }.to_json
end
