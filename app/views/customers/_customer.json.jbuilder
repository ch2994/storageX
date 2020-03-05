json.extract! customer, :id, :user_name, :user_password, :first_name, :last_name, :email, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
