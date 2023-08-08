class UsersController < ApplicationController

    def index
        users = User.all
        render json: users
    end
    
    def as_json(options = {})
        super(options.merge(only: [:id, :name, :bio, :postcode, :username, :created_at, :updated_at]))
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
          render json: user
        else
          render json: { error: "Not authorized" }, status: :unauthorized
        end
    end
      

    def create 
        @user = User.create(user_params)
        puts "the user_params that got created is: #{user_params}"


        if @user.save

            session[:current_user_id] = @user.id

            render json: {username: @user.username}

            puts "this is the @user after the render: #{@user.attributes}"

            # render json: @user.attributes

        else
            puts "Validation Errors: #{@user.errors.full_messages}"

            render :new, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.require(:user).permit(:postcode, :bio, :name, :username, :password, :password_confirmation)
    end



end
