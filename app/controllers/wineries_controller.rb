class WineriesController < ApplicationController
    def index
        @wineries = Winery.all
    end

    def show
        @winery = Winery.find_by(id: params[:id])
    end

    def new
        @winery = Winery.new
        2.times {@winery.wines.build}
    end

    def create
        @winery = Winery.new(winery_params)
        if @winery.save
            redirect_to winery_path(@winery)
        else
            flash[:message] = @winery.errors.full_messages.join("")
            render :new
        end
    end

    private
        def winery_params
            params.require(:winery).permit(:name, :state, :country, :region, :established, wines_attributes: [:name, :wine_type, :year, :price, :opened, :notes])
        end
end
