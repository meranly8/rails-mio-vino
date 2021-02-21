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
end
