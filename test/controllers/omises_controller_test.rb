require 'test_helper'

class OmisesControllerTest < ActionController::TestCase
  setup do
    @omise = omises(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:omises)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create omise" do
    assert_difference('Omise.count') do
      post :create, omise: { address: @omise.address, homepage: @omise.homepage, name: @omise.name, tel: @omise.tel }
    end

    assert_redirected_to omise_path(assigns(:omise))
  end

  test "should show omise" do
    get :show, id: @omise
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @omise
    assert_response :success
  end

  test "should update omise" do
    patch :update, id: @omise, omise: { address: @omise.address, homepage: @omise.homepage, name: @omise.name, tel: @omise.tel }
    assert_redirected_to omise_path(assigns(:omise))
  end

  test "should destroy omise" do
    assert_difference('Omise.count', -1) do
      delete :destroy, id: @omise
    end

    assert_redirected_to omises_path
  end
end
