require 'test_helper'

class CostumersControllerTest < ActionController::TestCase
  setup do
    @costumer = costumers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:costumers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create costumer" do
    assert_difference('Costumer.count') do
      post :create, costumer: { correoE: @costumer.correoE, diraccion: @costumer.diraccion, facebook: @costumer.facebook, linkedin: @costumer.linkedin, nombre: @costumer.nombre, rfc: @costumer.rfc, telefono: @costumer.telefono }
    end

    assert_redirected_to costumer_path(assigns(:costumer))
  end

  test "should show costumer" do
    get :show, id: @costumer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @costumer
    assert_response :success
  end

  test "should update costumer" do
    patch :update, id: @costumer, costumer: { correoE: @costumer.correoE, diraccion: @costumer.diraccion, facebook: @costumer.facebook, linkedin: @costumer.linkedin, nombre: @costumer.nombre, rfc: @costumer.rfc, telefono: @costumer.telefono }
    assert_redirected_to costumer_path(assigns(:costumer))
  end

  test "should destroy costumer" do
    assert_difference('Costumer.count', -1) do
      delete :destroy, id: @costumer
    end

    assert_redirected_to costumers_path
  end
end
