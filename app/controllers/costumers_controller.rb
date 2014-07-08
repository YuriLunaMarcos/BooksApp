class CostumersController < ApplicationController
  before_action :set_costumer, only: [:show, :edit, :update, :destroy]

  # GET /costumers
  # GET /costumers.json
  def index 
    if params[:search] 
      @costumers = Costumer.where("nombre LIKE '%"+params[:search]+"%'")
      
    if @costumers.size.zero? 
      #flash[:resultado] = "No result found" 
      @costumers = Costumer.all
    end 
    else 
      @costumers = Costumer.all      
    end 
  end

  # GET /costumers/1
  # GET /costumers/1.json
  def show
  end

  # GET /costumers/new
  def new
    @costumer = Costumer.new
    @all_costumers = Costumer.all
    @costumer_employee = @costumer.promotions.build
  end

  # GET /costumers/1/edit
  def edit
  end

  # POST /costumers
  # POST /costumers.json
  def create
    @costumer = Costumer.new(costumer_params)

    respond_to do |format|
      if @costumer.save
        format.html { redirect_to @costumer, notice: 'Costumer was successfully created.' }
        format.json { render :show, status: :created, location: @costumer }
      else
        format.html { render :new }
        format.json { render json: @costumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /costumers/1
  # PATCH/PUT /costumers/1.json
  def update
    respond_to do |format|
      if @costumer.update(costumer_params)
        format.html { redirect_to @costumer, notice: 'Costumer was successfully updated.' }
        format.json { render :show, status: :ok, location: @costumer }
      else
        format.html { render :edit }
        format.json { render json: @costumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costumers/1
  # DELETE /costumers/1.json
  def destroy
    @costumer.destroy
    respond_to do |format|
      format.html { redirect_to costumers_url, notice: 'Costumer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def findRFC
    respond_to do |format|
      if params[:rfc]
        @costumer = Costumer.find_by rfc: params[:rfc]
      end
      if @costumer.nil?
        @costumer = Costumer.new
        format.html { render :new } 
      else
        format.html { render :show } 
      end
      format.json { render json: @costumer, status: :ok }
      #format.json { render json: @product, estado: :ok }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costumer
      @costumer = Costumer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def costumer_params
      params.require(:costumer).permit(:rfc, :nombre, :telefono, :facebook, :diraccion, :linkedin, :correoE)
    end
end
