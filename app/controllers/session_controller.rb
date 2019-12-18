class SessionController < ApplicationController
    before_action :logged_in_redirect, only: [:new, :create]

    def new        
    end

    def create
        user = User.find_by(user: params[:session][:user])
        if user && user.authenticate(params[:session][:password])
            flash[:success] = "Welcome #{user.user}!"
            session[:user_id] = user.id
            redirect_to root_path
        else
            flash.now[:error] = "Bad Credentials!"
            render 'new'
        end    
    end

    def destroy
        flash[:success] = "Goodbye!"
        session[:user_id] = nil
        redirect_to login_path
    end

    private

    def logged_in_redirect
        if logged_in?
            flash[:error] = "Already logged in!"
            redirect_to root_path
        end
    end

end