class CalificationsController < ApplicationController
    before_action :set_publication
    before_action :set_calification, only: [:destroy]


    def create
        if existing_calification?
           flash[:notice] = 'ya calificaste la publicación'
        else
          @publication.califications.create(user_id: current_user.id)
        end
        redirect_to root_path
    end
    
    def destroy
    if existing_calification?
        @calification.destroy
    end
    redirect_to root_path
    end


    private

        def set_publication
            @publication = Publication.find(params[:publication_id])
        end

        def set_calification
            @calification = Calification.find(params[:id])
        end

        def existing_calification?
            Calification.where(user_id: current_user.id, publication_id: params[:publication_id]).exists?
        end
end