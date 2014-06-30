class OrderDsController < ApplicationController
  before_action :set_order_d, only: [:show, :edit, :update, :destroy]

  # GET /order_ds
  # GET /order_ds.json
  def index
    @order_ds = OrderD.all
  end

  # GET /order_ds/1
  # GET /order_ds/1.json
  def show
  end

  # GET /order_ds/new
  def new
    @order_d = OrderD.new
  end

  # GET /order_ds/1/edit
  def edit
  end

  # POST /order_ds
  # POST /order_ds.json
  def create
    @order_d = OrderD.new(order_d_params)

    respond_to do |format|
      if @order_d.save
        format.html { redirect_to @order_d, notice: 'Order d was successfully created.' }
        format.json { render :show, status: :created, location: @order_d }
      else
        format.html { render :new }
        format.json { render json: @order_d.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_ds/1
  # PATCH/PUT /order_ds/1.json
  def update
    respond_to do |format|
      if @order_d.update(order_d_params)
        format.html { redirect_to @order_d, notice: 'Order d was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_d }
      else
        format.html { render :edit }
        format.json { render json: @order_d.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_ds/1
  # DELETE /order_ds/1.json
  def destroy
    @order_d.destroy
    respond_to do |format|
      format.html { redirect_to order_ds_url, notice: 'Order d was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_d
      @order_d = OrderD.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_d_params
      params.require(:order_d).permit(:order_id, :product_id, :acuerdo, :estado, :cantidad, :desceuento, :precioUnitario, :importeTotal)
    end
end
