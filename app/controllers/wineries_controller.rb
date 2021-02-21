class WineriesController < ApplicationController
    def index
        @wineries = Winery.all
    end
end
