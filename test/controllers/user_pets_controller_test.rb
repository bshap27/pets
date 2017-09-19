require 'test_helper'

class UserPetsControllerTest < ActionController::TestCase
  setup do
    @user_pet = user_pets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_pets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_pet" do
    assert_difference('UserPet.count') do
      post :create, user_pet: {  }
    end

    assert_redirected_to user_pet_path(assigns(:user_pet))
  end

  test "should show user_pet" do
    get :show, id: @user_pet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_pet
    assert_response :success
  end

  test "should update user_pet" do
    patch :update, id: @user_pet, user_pet: {  }
    assert_redirected_to user_pet_path(assigns(:user_pet))
  end

  test "should destroy user_pet" do
    assert_difference('UserPet.count', -1) do
      delete :destroy, id: @user_pet
    end

    assert_redirected_to user_pets_path
  end
end
