class ApicrudsController < ApplicationController
  before_action :set_apicrud, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token

  def index
    @apicruds = Apicrud.all
    if @apicruds
      render json: @apicruds
    else
      render json: {}
    end
  end

  def show
    render json: @apicrud
  end

  def create
    @apicrud = Apicrud.new(apicrud_params)
    verify = verify_params(apicrud_params["amount"], apicrud_params["price"])
    if verify[0]
      respond_to do |format|
        if @apicrud.save
          format.json { render action: 'show', status: :created }
        else
          format.json { render json: @apicrud.errors, status: :unprocessable_entity }
        end
      end
    else
      render json: { verify[1] => verify[2] }
    end
  end

  def update
    respond_to do |format|
      if @apicrud.update(apicrud_params)
        format.json { render json: { "menssage" => "Update performed successfully" } }
      else
        format.json { render json: @apicrud.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @apicrud.destroy
    respond_to do |format|
      format.json { render json: { "message" => "Removal successful" } }
    end
  end

  private
    def set_apicrud
      @apicrud = Apicrud.find(params[:id])
    end

    def apicrud_params
      params.require(:apicrud).permit(:sku, :name, :description, :amount, :price)
    end

    def verify_params(amount, price)
      if !amount.kind_of?Integer
        [false, "amount", "Amount can only be interger type"]
      elsif price.kind_of?String
        [false, "price", "The price can only be of floating type"]
      else
        [true, ""]
      end
    end
end
gem install rubocop