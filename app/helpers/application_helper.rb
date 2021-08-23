module ApplicationHelper

    def calification(publication,user)
        publication.califications.find{|calification| calification.user_id == user.id}
    end

end
