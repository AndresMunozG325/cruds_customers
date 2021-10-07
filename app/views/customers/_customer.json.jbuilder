json.extract! customer, :id, :rut, :business_name, :business_line, :address, :created_at, :updated_at
json.url customer_url(customer, format: :json)
