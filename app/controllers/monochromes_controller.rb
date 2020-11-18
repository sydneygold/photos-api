class MonochromesController < ApplicationController
    def index
        @monochromes = Monochrome.all 

        render json: @monochromes
    end

    def show
        @monochrome = Monochrome.find(params[:id])

        render json: @monochrome
    end

    def create
        @monochrome = Monochrome.create(
            title: params[:title], 
            caption: params[:caption],
            image: params[:image]
        )

        render json: @monochrome
    end

    def update
        @monochrome = Monochrome.find(params[:id])

        @monochrome.update(mono_params)

        render json: @monochrome
    end

    def destroy
        @monochrome = Monochrome.find(params[:id])

        @monochrome.destroy

        render status: :no_content
    end

    private

    def mono_params
        params.require(:monochrome).permit(:title, :caption, :image)
    end
end
