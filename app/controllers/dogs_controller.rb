class DogsController < ApplicationController
    # before_action :authenticate 
    
    def index
        dogs = Dog.all
        dog_attributes = dogs.map(&:attributes)
      
        puts "The dog attributes are: #{dog_attributes}"
        puts "The dogs are: #{dogs}"
      
        render json: dog_attributes
      end

    def create 
        owner = Owner.find(dog_params[:owner_id])
        dog = owner.dogs.build(dog_params)
        
        if dog.save
        
            render json: dog

            puts "this is the user after the render: #{dog.attributes}"

        else
            puts "Validation Errors: #{@dogs.errors.full_messages}"

            render :new, status: :unprocessable_entity
        end
    end

    def show
        dog = Dog.find_by(id: params[:id])
        if dog
        puts "the dog is #{dog}"
          puts "the dog id is #{dog.id}"
          puts "the dog owner_id is #{dog.owner_id}"
          puts "the dog is: #{dog.attributes}"
          dogAttributes = dog.attributes

          render json: dogAttributes

        else
          render json: { error: "no ID" }, status: :not_found
        end
    end

    def update

        dog = Dog.find_by(id: params[:id])
        puts "the id of the dog is #{params[:id]}"
        puts "this is the old dog before updating: #{dog.attributes}"

        dog.update(
            id_of_owner: params[:id_of_owner],
            name_of_dog: params[:name_of_dog],
            age_of_dog: params[:age_of_dog],
            breed_of_dog: params[:breed_of_dog],
            bio_of_dog: params[:bio_of_dog],
            location_postCode: params[:location_postCode],
            dates_require_dogSitting: params[:dates_require_dogSitting]
          )
        dog.save
        puts "this is the new updated dog: #{dog.attributes}"
        render json: dog
        # head :no_content
    end


    def destroy
        dog = Dog.find_by(id: params[:id])
        puts "the id of dog is #{dog.id}"
        dog.delete
        puts "The dog has been successfully deleted"
        head :no_content
    end

    private
    def dog_params
        params.permit(:owner_id, :id_of_owner, :name_of_dog, :age_of_dog, :breed_of_dog, :bio_of_dog, :location_postCode, :dates_require_dogSitting)
    end

    def authenticate
        render json: {error: "NOT LOGGED IN"} unless session[:user_id]
               
    end
end