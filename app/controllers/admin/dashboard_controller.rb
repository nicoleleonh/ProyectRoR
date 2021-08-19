class Admin::DashboardController < Admin::BaseController
    def index
        @Publication = Publication.all
        @publicationscreate = Publication.group(:user_id).count
    end

    

end
