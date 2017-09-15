require 'test_helper'

class PetBreedsControllerTest < ActionController::TestCase
  setup do
    @pet_breed = pet_breeds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pet_breeds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pet_breed" do
    assert_difference('PetBreed.count') do
      post :create, pet_breed: {  }
    end

    assert_redirected_to pet_breed_path(assigns(:pet_breed))
  end

  test "should show pet_breed" do
    get :show, id: @pet_breed
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pet_breed
    assert_response :success
  end

  test "should update pet_breed" do
    patch :update, id: @pet_breed, pet_breed: {  }
    assert_redirected_to pet_breed_path(assigns(:pet_breed))
  end

  test "should destroy pet_breed" do
    assert_difference('PetBreed.count', -1) do
      delete :destroy, id: @pet_breed
    end

    assert_redirected_to pet_breeds_path
  end
end
