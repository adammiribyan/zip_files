require 'test_helper'

class DeliveryFilesControllerTest < ActionController::TestCase
  setup do
    @delivery_file = delivery_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:delivery_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create delivery_file" do
    assert_difference('DeliveryFile.count') do
      post :create, delivery_file: { file: @delivery_file.file, name: @delivery_file.name }
    end

    assert_redirected_to delivery_file_path(assigns(:delivery_file))
  end

  test "should show delivery_file" do
    get :show, id: @delivery_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @delivery_file
    assert_response :success
  end

  test "should update delivery_file" do
    put :update, id: @delivery_file, delivery_file: { file: @delivery_file.file, name: @delivery_file.name }
    assert_redirected_to delivery_file_path(assigns(:delivery_file))
  end

  test "should destroy delivery_file" do
    assert_difference('DeliveryFile.count', -1) do
      delete :destroy, id: @delivery_file
    end

    assert_redirected_to delivery_files_path
  end
end
