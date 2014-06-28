class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.costumer = Costumer.new 
    #valores predeterminados
    @order.orderDs << OrderD.new(:importeTotal => 100, :product_id => 4, :cantidad => 1, :precioUnitario => 100, :desceuento => 10)   
  end 

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    costumer = Costumer.new(costumer_params)    
    #al recibir los datos, comprobar si existe el cliente, entonces se pueden actualizar sus datos
    # si no existe el cliente, registrar un nuevo
  
    puts "Datos recibidos de la nueva venta"
 #   @sale.client.nombre = client.nombre ##si el cliente ya existe, se actualiza al nuevo valor recibido
    puts "Cliente>> " + @order.cliente_id.to_s # + @order.costumer.nombr
    puts "Productos recibidos: "     
    
    @order.orderDs.each do |item|
    # #params[:saledetails].each do |item|
       puts "id: " + item.product_id.to_s + ", p. u: " + item.precioUnitario.to_s + ", cantidad: " + item.cantidad.to_s +
        ", importe: " + item.importeTotal.to_s 
    end     

     respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
     end
   
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:usuario_id, :cliente_id, :fechaPedido, :fechaEntrega, :fechaRealEntrega, :estado)
    end
    def costumer_params
      params.require(:costumer).permit(:rfc, :nombre, :telefono, :facebook, :diraccion, :linkedin, :correoE)
    end
end
