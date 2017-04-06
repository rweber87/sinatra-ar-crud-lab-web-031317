require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  #Create

  get '/posts/new' do 
  	erb :'/new'
  end

  post '/posts' do 
  	@new_post = Post.create(name: params["name"], content: params["content"])
  	redirect '/posts'
  end

  #Read

  get '/posts' do
  	@posts = Post.all 
    erb :index
  end

  get '/posts/:id' do 
  	@post = Post.find(params[:id])
  	erb :show
  end

  #Update

  get '/posts/:id/edit' do
  	@post = Post.find(params[:id]) 
  	erb :edit
  end

  patch '/posts/:id' do
  	@post = Post.find(params[:id])
  	@post.update(name: params["name"], content: params["content"])
  	redirect "/posts/#{@post.id}"
  end

  #Destroy

  delete '/posts/:id' do 
		@post = Post.find(params[:id])
		@post.destroy
		erb :"/delete"
  end
  

  

end