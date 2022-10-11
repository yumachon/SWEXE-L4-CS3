class TopController < ApplicationController
    def main
        if session[:login_uid]
            render "main"
        else
            render "login"
        end
    end
    def login
        if BCrypt::Password.new("$2a$08$viKmGnPiMpAmuzbConQgeObsmHbYLM9pyEtC9hgGSNJUk9s34jzyC") == params[:pass]
            
            session[:login_uid] = params[:uid]
            redirect_to root_path
        else
            render 'error'
        end
    end
    def logout
        session.delete(:login_uid)
        render "login"
    end
end
