class LandingController < ApplicationController
  include Accessible
  def index
    if user_signed_in?
      redirect_to publications_path
    end

    @publications = Publication.last(3)
  end
end
