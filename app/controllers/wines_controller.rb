class WinesController < ApplicationController
    def index
        @wines = Wine.order_by_year
    end

    def show 
        @wine = Wine.find_by(id: params[:id])
    end

    def new
        @wine = Wine.new
    end

    def create
        @wine = Wine.new(wine_params)
        if @wine.save
            redirect_to wine_path(@wine)
        else
            flash[:message] = @wine.errors.full_messages.join("")
            render :new
        end

    end

    private
        def wine_params
            params.require(:wine).permit(:name, :wine_type)
        end
end
