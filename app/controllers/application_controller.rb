require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
    set :public_folder, File.dirname(__FILE__) + '/static'
    set :views, 'app/views'
  end

  not_found do
    erb :error
  end

  get '/' do
    erb :index
  end

  get '/signup' do
    if User.is_logged_in?(session)
      @user = User.current_user(session)
      redirect '/index'
    else
      erb :'/users/create_user'
    end
  end

  post '/users' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect '/signup'
    else
      @user = User.new(params)
      if @user.save
        session[:user_id] = @user.id
        redirect '/index'
      else
        redirect '/signup'
      end
    end
  end

  get '/login' do
    if User.is_logged_in?(session)
      @user = User.current_user(session)
      redirect '/index'
    else
      erb :'/users/login'
    end
  end

  post '/login' do
    if params[:username].empty? || params[:password].empty?
      redirect '/login'
    else
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect '/index'
      else
        redirect '/login'
      end
    end
  end

  get '/logout' do
    if User.is_logged_in?(session)
      session.clear
      redirect '/'
    else
      redirect '/login'
    end
  end

  get '/index' do
    if User.is_logged_in?(session)
      @user = User.current_user(session)
      erb :'/users/user_index'
    else
      redirect '/login'
    end
  end

  get '/:slug/bookcase' do
    if !User.is_logged_in?(session)
      redirect '/login'
    else
      @user = User.current_user(session)
      if @user.slug == params[:slug]
        erb :'/users/show_user'
      else
        redirect '/index'
      end
    end
  end

  get '/books/new' do
    if User.is_logged_in?(session)
      erb :'/books/create_book'
    else
      redirect '/login'
    end
  end

  post '/books' do
    if params[:title].empty? || params[:author].empty?
      redirect '/books/new'
    else
      @book = Book.create(title: params[:title], author: params[:author], user_id: User.current_user(session).id)
      redirect "/#{User.current_user(session).slug}/bookcase"
    end
  end

  get '/books/:id' do
    if User.is_logged_in?(session)
      @book = Book.find(params[:id])
      if @book.user == User.current_user(session)
        erb :'/books/show_book'
      else
        redirect '/index'
      end
    else
      redirect '/login'
    end
  end

  get '/books/:id/edit' do
    if User.is_logged_in?(session)
      @book = Book.find(params[:id])
      if @book.user == User.current_user(session)
        erb :'/books/edit_book'
      else
        redirect '/index'
      end
    else
      redirect '/login'
    end
  end

  patch '/books/:id' do
    if params[:title].empty? || params[:author].empty?
      redirect "/books/#{params[:id]}/edit"
    else
      @book = Book.find(params[:id])
      @book.update(title: params[:title], author: params[:author], to_read: params[:to_read])
      redirect "/books/#{params[:id]}"
    end
  end

  delete '/books/:id/delete' do
    if User.is_logged_in?(session)
      @book = Book.find(params[:id])
      if @book.user == User.current_user(session)
        @book.delete
        redirect "/index"
      else
        redirect "/index"
      end
    else
      redirect '/login'
    end
  end

end
