class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[ show ]
  before_action :authenticate_user!
  before_action :set_publication_currentuser, only: %i[ edit update destroy ]


  # GET /publications or /publications.json
  def index
    @q = Publication.ransack(params[:q])
    @publications = @q.result(distinct: true)
  end

  # GET /publications/1 or /publications/1.json
  def show
  end

  # GET /publications/new
  def new
    @publication = Publication.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications or /publications.json
  def create
    @user = current_user
    @publication = @user.publications.new(publication_params)

    respond_to do |format|
      if @publication.save
        PublicationsMailer.publication_create.deliver_later
        format.html { redirect_to @publication, notice: "Publication was successfully created." }
        format.json { render :show, status: :created, location: @publication }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publications/1 or /publications/1.json
  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to @publication, notice: "Publication was successfully updated." }
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publications/1 or /publications/1.json
  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to publications_url, notice: "Publication was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def set_publication_currentuser
    @publication = current_user.publications.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publication
      @publication = Publication.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def publication_params
      params.require(:publication).permit(:name, :age, :image, :description, :amountoraise, :amountcollected, :califications, :user_id, documents: [])
    end
end
