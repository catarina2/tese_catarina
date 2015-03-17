require 'test_helper'

class ResistsControllerTest < ActionController::TestCase
  setup do
    @resist = resists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:resists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resist" do
    assert_difference('Resist.count') do
      post :create, resist: { drug_id: @resist.drug_id, isolated_id: @resist.isolated_id, mic: @resist.mic, reference: @resist.reference }
    end

    assert_redirected_to resist_path(assigns(:resist))
  end

  test "should show resist" do
    get :show, id: @resist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resist
    assert_response :success
  end

  test "should update resist" do
    patch :update, id: @resist, resist: { drug_id: @resist.drug_id, isolated_id: @resist.isolated_id, mic: @resist.mic, reference: @resist.reference }
    assert_redirected_to resist_path(assigns(:resist))
  end

  test "should destroy resist" do
    assert_difference('Resist.count', -1) do
      delete :destroy, id: @resist
    end

    assert_redirected_to resists_path
  end
end
