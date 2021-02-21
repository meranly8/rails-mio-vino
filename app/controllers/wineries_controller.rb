class WineriesController < ApplicationController
    def index
        @wineries = Winery.all
    end

    def show
        @winery = Winery.find_by(id: params[:id])
    end
end
