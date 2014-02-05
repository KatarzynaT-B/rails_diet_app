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

    respond_to do |format|
      if @profile.save
        update_profile_with_needs(@profile)
        format.html { redirect_to @profile, notice: 'Profil został utworzony' }
        format.json { render action: 'show', status: :created, location: @profile }
      else
        format.html { render action: 'new' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        update_profile_with_needs(@profile)
        format.html { redirect_to @profile, notice: 'Profil został uaktualniony' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url }
      format.json { head :no_content }
    end
  end

  private

    def set_profile
      @profile = Profile.find(params[:id])
    end

    def profile_params
      params.require(:profile).permit(:name, :sex, :age, :weight, :height, :activity_level, :calories_need, :protein_need, :fat_need, :carbs_need)
    end
end
