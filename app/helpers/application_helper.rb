module ApplicationHelper
    def nav_bar
        if logged_in?
            "Hi, #{current_user.name} | #{link_to "Wine List", wines_path} | #{link_to "Winery List", wineries_path} | #{link_to "Logout", logout_path}"
        end
    end
end
