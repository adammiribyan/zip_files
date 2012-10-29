require 'test_helper'

class SourceWorkFilesControllerTest < ActionController::TestCase
  setup do
    @source_work_file = source_work_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_work_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_work_file" do
    assert_difference('SourceWorkFile.count') do
      post :create, source_work_file: { file: @source_work_file.file, name: @source_work_file.name }
    end

    assert_redirected_to source_work_file_path(assigns(:source_work_file))
  end

  test "should show source_work_file" do
    get :show, id: @source_work_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @source_work_file
    assert_response :success
  end

  test "should update source_work_file" do
    put :update, id: @source_work_file, source_work_file: { file: @source_work_file.file, name: @source_work_file.name }
    assert_redirected_to source_work_file_path(assigns(:source_work_file))
  end

  test "should destroy source_work_file" do
    assert_difference('SourceWorkFile.count', -1) do
      delete :destroy, id: @source_work_file
    end

    assert_redirected_to source_work_files_path
  end
end
