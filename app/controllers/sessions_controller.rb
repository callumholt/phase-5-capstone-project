class SessionsController < ApplicationController

    def create
        user = User.find_by(email: params[:email])
        
        puts "the email found is: #{user.email}"
        puts "the password found is: #{user.password_digest}"

        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            puts "If you see this it means the IF statement was TRUTHY!"

            render json: {name: user.name}

        else
            render json: { error: "Incorrect username or password" }, status: :unprocessable_entity


        end
    end
    
    def destroy
        session.delete :user_id
        head :no_content
    end

end
