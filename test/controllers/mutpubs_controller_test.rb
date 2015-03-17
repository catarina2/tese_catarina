require 'test_helper'

class MutpubsControllerTest < ActionController::TestCase
  setup do
    @mutpub = mutpubs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mutpubs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mutpub" do
    assert_difference('Mutpub.count') do
      post :create, mutpub: { mutation_id: @mutpub.mutation_id, publication_id: @mutpub.publication_id }
    end

    assert_redirected_to mutpub_path(assigns(:mutpub))
  end

  test "should show mutpub" do
    get :show, id: @mutpub
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mutpub
    assert_response :success
  end

  test "should update mutpub" do
    patch :update, id: @mutpub, mutpub: { mutation_id: @mutpub.mutation_id, publication_id: @mutpub.publication_id }
    assert_redirected_to mutpub_path(assigns(:mutpub))
  end

  test "should destroy mutpub" do
    assert_difference('Mutpub.count', -1) do
      delete :destroy, id: @mutpub
    end

    assert_redirected_to mutpubs_path
  end
end
