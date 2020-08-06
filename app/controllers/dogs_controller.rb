class DogsController < ApplicationController
    def index
        @dogs = Dog.all
    end

    def show
        find_dog
    end

    def new
        @dog = Dog.new
    end

    def create
        @dog = Dog.create(name: params[:name], age: params[:age], breed: params[:breed])
        redirect_to dogs_path(@dog)
    end

    def edit
        find_dog
    end

    def update
        find_dog
        @dog.update(name: params[:name], age: params[:age], breed: params[:breed])
    end

    def destroy
        instance = find_dog
        instance.destroy
        redirect_to dogs_path
    end

    private

    def params_path(*args)
        params.require(:dogs).permit(*args)
    end

    def find_dog
        @dog = Dog.find(params[:id])
    end

end
