class CatsController < ApplicationController

    def index
        @cats = Cat.all 

        render json: @cats
    end

    def show
        @cat = Cat.find(params[:id])

        render json: @cat
    end

    def create
        @cat = Cat.create(
            title: params[:title], 
            caption: params[:caption],
            image: params[:image]
        )

        render json: @cat
    end

    def update
        @cat = Cat.find(params[:id])

        @cat.update(cat_params)

        render json: @cat
    end

    def destroy
        @cat = Cat.find(params[:id])

        @cat.destroy

        render status: :no_content
    end

    private

    def cat_params
        params.require(:cat).permit(:title, :caption, :image)
    end
end
