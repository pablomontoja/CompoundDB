require 'test_helper'

class CompoundsControllerTest < ActionController::TestCase
  setup do
    @compound = compounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:compounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create compound" do
    assert_difference('Compound.count') do
      post :create, compound: { amount: @compound.amount, cas: @compound.cas, molar_mass: @compound.molar_mass, molecular_formula: @compound.molecular_formula, name: @compound.name, room_number: @compound.room_number, shelf: @compound.shelf, structure: @compound.structure }
    end

    assert_redirected_to compound_path(assigns(:compound))
  end

  test "should show compound" do
    get :show, id: @compound
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @compound
    assert_response :success
  end

  test "should update compound" do
    patch :update, id: @compound, compound: { amount: @compound.amount, cas: @compound.cas, molar_mass: @compound.molar_mass, molecular_formula: @compound.molecular_formula, name: @compound.name, room_number: @compound.room_number, shelf: @compound.shelf, structure: @compound.structure }
    assert_redirected_to compound_path(assigns(:compound))
  end

  test "should destroy compound" do
    assert_difference('Compound.count', -1) do
      delete :destroy, id: @compound
    end

    assert_redirected_to compounds_path
  end
end
