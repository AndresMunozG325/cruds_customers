class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index

    @customers = Fetchers::FetchCustomerService.index(params)
    Rails.logger.info "---- customers" + @customers.inspect
    respond_to do |format|
      format.js
      format.html
    end
    
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    creating, @customer, message = Cruds::CrudCustomerService.create(customer_params)

    if creating
      redirect_to @customer, notice: "Customer was successfully created."
    else
      render :new, notice: message
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update

    updating, @customer, message = Cruds::CrudCustomerService.update(@customer, customer_params)

    if updating
      redirect_to @customer, notice: "Customer was successfully updated."
    else
      render :edit, notice: message
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    deleting, @customer = Cruds::CrudCustomerService.destroy(@customer)
    if deleting
      redirect_to customers_url, notice: "Customer was successfully destroyed."
    else
      render :index, notice: error
    end

    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Fetchers::FetchCustomerService.set(params)
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:rut, :business_name, :business_line, :address)
    end
end
