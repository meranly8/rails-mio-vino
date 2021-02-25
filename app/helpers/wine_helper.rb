module WineHelper
    def header_display(wine)
        if wine
            tag.h1("All #{wine.name} Wines")
        else
            tag.h2("All Wines")
        end
    end

    def display_winery_fields(winery, f)
        if winery
            f.hidden_field :winery_id #will send wine_id in via params without user seeing anything
        else
            render partial: 'winery_select', locals: {f: f}
        end
    end
end
