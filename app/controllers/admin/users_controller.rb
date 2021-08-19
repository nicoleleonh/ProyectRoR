class Admin::UsersController < Admin::BaseController
    before_action :set_user, only: %i[ show edit update destroy ]

    def index
        @users = User.all
    end

    def new
        @users = User.new
    end

    def edit
    end

    def destroy
        @user.destroy
        respond_to do |format|
          format.html { redirect_to admin_users_path, notice: "User was successfully destroyed." }
          format.json { head :no_content }
        end
    end


    def update
        respond_to do |format|
            if @user.update(user_params)
              format.html { redirect_to admin_users_path, notice: "user was successfully updated." }
              format.json { render :show, status: :ok, location: @user }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @user.errors, status: :unprocessable_entity }
            end
          end
    end
    def create
        @users = User.new(user_params)

        respond_to do |format|
            if @users.save
                format.html { redirect_to @users, notice: "user was successfully created." }
                format.json { render :show, status: :created, location: @users }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @users.errors, status: :unprocessable_entity }
            end
        end
    end


    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:email)
    end

   
end