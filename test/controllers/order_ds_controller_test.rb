require 'test_helper'

class OrderDsControllerTest < ActionController::TestCase
  setup do
    @order_d = order_ds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_ds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_d" do
    assert_difference('OrderD.count') do
      post :create, order_d: { acuerdo: @order_d.acuerdo, cantidad: @order_d.cantidad, desceuento: @order_d.desceuento, estado: @order_d.estado, importeTotal: @order_d.importeTotal, order_id: @order_d.order_id, precioUnitario: @order_d.precioUnitario, product_id: @order_d.product_id }
    end

    assert_redirected_to order_d_path(assigns(:order_d))
  end

  test "should show order_d" do
    get :show, id: @order_d
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_d
    assert_response :success
  end

  test "should update order_d" do
    patch :update, id: @order_d, order_d: { acuerdo: @order_d.acuerdo, cantidad: @order_d.cantidad, desceuento: @order_d.desceuento, estado: @order_d.estado, importeTotal: @order_d.importeTotal, order_id: @order_d.order_id, precioUnitario: @order_d.precioUnitario, product_id: @order_d.product_id }
    assert_redirected_to order_d_path(assigns(:order_d))
  end

  test "should destroy order_d" do
    assert_difference('OrderD.count', -1) do
      delete :destroy, id: @order_d
    end

    assert_redirected_to order_ds_path
  end
end
