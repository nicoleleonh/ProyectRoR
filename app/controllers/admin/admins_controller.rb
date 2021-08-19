class Admin::AdminsController < Admin::BaseController
    def index
        @admins = Admin.all
    end

    def new
        @admin = Admin.new
    end

    def create
        @admin = Admin.new(admin_params)

        respond_to do |format|
            if @admin.save
                format.html { redirect_to @admin, notice: "admin was successfully created." }
                format.json { render :show, status: :created, location: @admin }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @admin.errors, status: :unprocessable_entity }
            end
        end
    end


    private

    def admin_params
        params.require(:admin).permit(:email, :password)
    end

   
end