# 회원가입 폼을 오버라이드하기위한 컨트롤러
class RegistrationsController < Devise::RegistrationsController

    def new
        super
    end

    def create
        
        @user = User.new(params.require(:user).permit(:name, :phone, :email, :password))
        @user.save
        if params[:name] != "" 
            @farm = Farm.new(params.permit(:name, :farm_type, :admin, :location))
            @farm.user_id = User.last.id
            @farm.save
        end        
        sign_in(@user, bypass: true)
        redirect_to root_url
    end

    def update
        super
    end
end 