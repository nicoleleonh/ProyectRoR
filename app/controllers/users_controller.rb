class UsersController < ApplicationController
    def show
        @user = current_user
        @publicationstoraise = @user.publications.group(:amountoraise).count
        @publicationstocollected = @user.publications.group(:amountcollected).count
    end
end
