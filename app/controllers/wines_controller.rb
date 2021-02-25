class WinesController < ApplicationController
    def index
        if params[:winery_id] && @winery = Winery.find_by_id(params[:winery_id])
            @wines = @winery.wines.order_by_year
        else
            @wines = Wine.order_by_year
        end
    end

    def show 
        @wine = Wine.find_by(id: params[:id])
    end

    def new
        if params[:winery_id] && @winery = Winery.find_by_id(params[:winery_id])
            @wine = @winery.wines.build
        else
            @wine = Wine.new
            @wine.build_winery
        end
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
            params.require(:wine).permit(:name, :wine_type, :year, :price, :opened, :notes, :winery_id, winery_attributes: [:name, :state, :country, :region, :established])
        end
end
