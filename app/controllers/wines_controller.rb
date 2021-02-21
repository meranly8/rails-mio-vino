class WinesController < ApplicationController
    def index
        @wines = Wine.all
    end

    def show 

    end
end
