require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  setup do
    @profile = profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profile" do
    assert_difference('Profile.count') do
      post :create, profile: { actibity_level: @profile.actibity_level, age: @profile.age, calories_need: @profile.calories_need, carbs_need: @profile.carbs_need, fat_need: @profile.fat_need, height: @profile.height, name: @profile.name, protein_need: @profile.protein_need, sex: @profile.sex, weight: @profile.weight }
    end

    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should show profile" do
    get :show, id: @profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profile
    assert_response :success
  end

  test "should update profile" do
    patch :update, id: @profile, profile: { actibity_level: @profile.actibity_level, age: @profile.age, calories_need: @profile.calories_need, carbs_need: @profile.carbs_need, fat_need: @profile.fat_need, height: @profile.height, name: @profile.name, protein_need: @profile.protein_need, sex: @profile.sex, weight: @profile.weight }
    assert_redirected_to profile_path(assigns(:profile))
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete :destroy, id: @profile
    end

    assert_redirected_to profiles_path
  end
end
