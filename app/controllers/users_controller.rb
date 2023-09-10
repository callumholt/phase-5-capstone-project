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
        puts "the user_params are: #{user_params}"
        @user = User.create(user_params)
        puts "the user_params that got created is: #{user_params}"
        api_key = ENV['OPEN_AI_KEY']
        pits "the openai api_key is: #{api_key}"


        if @user.save

            session[:current_user_id] = @user.id

            render json: {name: @user.name, id: @user.id}

            puts "this is the @user and @id after the render: #{@user.name} and #{@user.id}"

        else
            puts "Validation Errors: #{@user.errors.full_messages}"

            render :new, status: :unprocessable_entity
        end
    end

    private
    def user_params
        params.permit(:email, :name, :password, :password_confirmation)
    end

    # require(:user)

end
