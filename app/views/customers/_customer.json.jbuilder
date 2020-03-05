json.extract! customer, :id, :username, :first_name, :last_name, :email, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
