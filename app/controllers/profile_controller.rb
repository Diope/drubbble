class ProfileController < ApplicationController
  before_action :find_profile
  before_action :find_user
  before_action :authenticate_user!, except: :show

  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.create_profile(profile_params)
  end

  def index
  end

  def show
    @profile = @user.profile
  end

  def update
    @profile.update_attributes(profile_params)
    if @profile.save
      redirect_to profile_path(current_user)
    end
  end

  def edit
  end

  def destroy
  end

  private

    def find_user
      @user = User.find(params[:id])
    end

    def find_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:tagline, :location, :website, :available)
    end
end
