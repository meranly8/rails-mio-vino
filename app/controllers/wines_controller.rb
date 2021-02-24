class WinesController < ApplicationController
    def index
        @wines = Wine.order_by_year
    end

    def show 
        @wine = Wine.find_by(id: params[:id])
    end

    def new
        @wine = Wine.new
        @wine.build_winery
    end

    def create
        @wine = current_user.wines.build(wine_params)
        if @wine.save
            redirect_to wine_path(@wine)
        else
            flash[:message] = @wine.errors.full_messages.join("")
            render :new
        end
    end

    def edit
        @wine = Wine.find_by(id: params[:id])
    end

    def updated
        wine = Wine.find_by(id: params[:id])
        wine.update(wine_params)
        redirect_to wine_path(wine)
    end

    def destroy
        wine = Wine.find_by(id: params[:id])
        wine.destroy
        redirect_to user_path(current_user)
    end

    private
        def wine_params
            params.require(:wine).permit(:name, :wine_type, :year, :price, :opened, :notes, winery_attributes = [:name, :state, :country, :region, :established])
        end
end
