class UsersController < ApplicationController

  before_action :authenticate_user!

    def index
      @users = User.all
    end

    def new
    end
    def create
        puts "CHECK HERE", params.inspect
    end

    def show
      @user =User.find(params[:id])

    end

    def edit

    end

    def update

    end

    def destroy
    end



end
