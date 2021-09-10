class UsersController < ApplicationController
    def show
        @user = current_user
        @publication_states = @user.publications.group(:available).count
        @last_donations = @user.publications_donations.order(created_at: :desc).limit(5)
    end
end

