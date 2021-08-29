class Admin::PublicationsController < Admin::BaseController
    def index
        @publication = Publication.all
    end

    def new
        @publication = Publication.new
    end

    def create
        @publication = Publication.new(publication)

        respond_to do |format|
            if @publication.save
                PostMailer.publication_create.delivery_later
                format.html { redirect_to @publication, notice: "publication was successfully created." }
                format.json { render :show, status: :created, location: @publication }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @publication.errors, status: :unprocessable_entity }
            end
        end
    end


    private

    def publication_params
        params.require(:publication).permit(:name, :age, :amountoraise, :amountcollected, :user_id)
    end

   
end