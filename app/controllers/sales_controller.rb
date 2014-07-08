class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]

  # GET /sales
  # GET /sales.json
  def index
    @sales = Sale.all
  end

  # GET /sales/1
  # GET /sales/1.json
  def show
  end

  # GET /sales/new
  def new
    @sale = Sale.new
    @costumer = Costumer.new
    #@order.orderDs << OrderD.new(:importeTotal => 100, :books_id => 4, :cantidad => 1, :precioUnitario => 100, :desceuento => 10) 
  end

  # GET /sales/1/edit
  def edit
  end

  # POST /sales
  # POST /sales.json
  def create
    @sale = Sale.new(sale_params)
    costumer= Costumer.new(costumer_params)
    #@sale.fecha = Time.new

     if @sale.costumer_id.nil?
      @sale.costumer= costumer
   else
      @sale.costumer.rfc = costumer.rfc
      @sale.costumer.nombre = costumer.nombre
      @sale.costumer.telefono = costumer.telefono
      @sale.costumer.facebook = costumer.facebook
      @sale.costumer.diraccion = costumer.diraccion
      @sale.costumer.linkedin = costumer.linkedin
      @sale.costumer.correoE= costumer.correoE
      end 
      puts "Datos recibidos de la nueva venta"

    puts"Cliente>>" + @sale.costumer_id.to_s + @sale.costumer.nombre
    puts "productos recibidos"
    
    @sale.detailSales.each do |item|
       puts "id: " + item.book_id.to_s + ", p. u: " + item.precio.to_s + ", cantidad: " +  item.cantidad.to_s + ", descuento: " + item.descuento.to_s + ", total:" + item.total.to_s
      end 
 #   @sale.client.nombre = client.nombre ##si el cliente ya existe, se actualiza al nuevo valor recibido
     #puts "Costumer> " + @order.costumer_id.to_s # + @order.costumer.nombr
     #puts "Productos recibidos: "     
    
     #@order.orderDs.each do |item|
    # #params[:saledetails].each do |item|
        #puts "id: " + item.book_id.to_s + ", p. u: " + item.precioUnitario.to_s + ", cantidad: " + item.cantidad.to_s +
         #", importe: " + item.importeTotal.to_s 
     #end 
      respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1
  # PATCH/PUT /sales/1.json
  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Sale was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1
  # DELETE /sales/1.json
  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale
      @sale = Sale.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_params
       params.require(:sale).permit(:costumer_id, :detailSales_attributes => [:book_id, :precio, :cantidad, :total] )
    end

    def costumer_params
      params.require(:costumer).permit(:id,:rfc, :nombre, :telefono, :facebook, :diraccion, :linkedin, :correoE)
    end
end