require 'test_helper'

class UserBreedsControllerTest < ActionController::TestCase
  setup do
    @user_breed = user_breeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_breeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_breed" do
    assert_difference('UserBreed.count') do
      post :create, user_breed: {  }
    end

    assert_redirected_to user_breed_path(assigns(:user_breed))
  end

  test "should show user_breed" do
    get :show, id: @user_breed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_breed
    assert_response :success
  end

  test "should update user_breed" do
    patch :update, id: @user_breed, user_breed: {  }
    assert_redirected_to user_breed_path(assigns(:user_breed))
  end

  test "should destroy user_breed" do
    assert_difference('UserBreed.count', -1) do
      delete :destroy, id: @user_breed
    end

    assert_redirected_to user_breeds_path
  end
end
