class ApicrudsController < ApplicationController
  before_action :set_apicrud, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  # GET /apicruds
  # GET /apicruds.json
  def index
    @apicruds = Apicrud.all
    if @apicruds
      render json: @apicruds
    else
      render json: {}
    end
  end

  # GET /apicruds/1
  # GET /apicruds/1.json
  def show
    render json: @apicrud
  end

  # POST /apicruds
  # POST /apicruds.json
  def create
    @apicrud = Apicrud.new(apicrud_params)

    respond_to do |format|
      if @apicrud.save
        format.json { render action: 'show', status: :created }
      else
        format.json { render json: @apicrud.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apicruds/1
  # PATCH/PUT /apicruds/1.json
  def update
    respond_to do |format|
      if @apicrud.update(apicrud_params)
        format.json { head :no_content }
      else
        format.json { render json: @apicrud.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apicruds/1
  # DELETE /apicruds/1.json
  def destroy
    @apicrud.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apicrud
      @apicrud = Apicrud.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apicrud_params
      params.require(:apicrud).permit(:sku, :name, :description, :amount, :price)
    end
end
