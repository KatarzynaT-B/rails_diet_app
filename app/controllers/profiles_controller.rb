class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  include ProfilesHelper

  def index
    @profiles = Profile.all
    @profiles.each do |profile|
      update_profile_with_needs(profile)
    end
    redirect_to new_profile_path if @profiles.empty?
  end

  def show
    @protein_kcal, @fat_kcal, @carbs_kcal = grams_to_kcal(@profile)
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      update_profile_with_needs(@profile)
      redirect_to @profile, notice: 'Profil został utworzony'
    else
      render action: 'new'
    end
  end

  def update
    if @profile.update(profile_params)
      update_profile_with_needs(@profile)
      redirect_to @profile, notice: 'Profil został uaktualniony'
    else
      render action: 'edit'
    end
  end

  def destroy
    @profile.destroy
    redirect_to profiles_url
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :sex, :age, :weight, :height, :activity_level, :calories_need, :protein_need, :fat_need, :carbs_need)
  end
end
