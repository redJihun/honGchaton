class RegistrationsController < Devise::RegistrationsController
    def new
        super
    end

    def create
        user = User.new
        user = params.require(:user).permit(:name, :phone, :email)
        user.save
    end

    def update
        super
    end

end