class Cruds::CrudCustomerService
  def self.create(params)
    customer = Customer.new(params)
    if customer.save
      return true, customer, nil
    else
      return false, customer, "Error al crear cliente"
    end
  end

  def self.update(customer, params)
    updated = customer.update(params)
    if updated
      return true, customer, nil
    else
      return false, customer, "Error al actualizar cliente"
    end
  end

  def self.destroy(customer)
    deleted = customer.destroy
    if deleted
      return true, customer, nil
    else
      return false, "Error al eliminar cliente"
    end
  end
end