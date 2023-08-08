class SessionsController < ApplicationController

    def create
        user = User.find_by(username: params[:username])
        
        puts "the username found is: #{user.username}"
        puts "the password found is: #{user.password_digest}"

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            puts "If you see this it means the IF statement was TRUTHY!"

            render json: {username: user.username}

        else
            render json: { error: "Incorrect username or password" }, status: :unprocessable_entity


        end
    end
    
    def destroy
        session.delete :user_id
        head :no_content
    end

end
