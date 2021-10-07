class Fetchers::FetchCustomerService
  def self.index(params)
    customers = Customer.all
    if params[:q].present?
      customers = customers.where("rut || business_name LIKE ?", "%#{params[:q]}%")
    end

    customers = customers.order(:created_at, :updated_at).page(params[:page]).per(6)
    #customers = Kaminari.paginate_array(customers).page(params[:page]).per(6)
    return customers
  end 
  
  def self.set(params)
    Customer.find(params[:id])
  end

end
