require 'test_helper'

class ApicrudsControllerTest < ActionController::TestCase
  setup do
    @apicrud = apicruds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:apicruds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create apicrud" do
    assert_difference('Apicrud.count') do
      post :create, apicrud: { amount: @apicrud.amount, description: @apicrud.description, name: @apicrud.name, price: @apicrud.price, sku: @apicrud.sku }
    end

    assert_redirected_to apicrud_path(assigns(:apicrud))
  end

  test "should show apicrud" do
    get :show, id: @apicrud
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @apicrud
    assert_response :success
  end

  test "should update apicrud" do
    patch :update, id: @apicrud, apicrud: { amount: @apicrud.amount, description: @apicrud.description, name: @apicrud.name, price: @apicrud.price, sku: @apicrud.sku }
    assert_redirected_to apicrud_path(assigns(:apicrud))
  end

  test "should destroy apicrud" do
    assert_difference('Apicrud.count', -1) do
      delete :destroy, id: @apicrud
    end

    assert_redirected_to apicruds_path
  end
end
