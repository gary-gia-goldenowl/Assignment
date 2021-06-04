json.extract! checkout, :id, :name, :phonenumber, :email, :address, :created_at, :updated_at
json.url checkout_url(checkout, format: :json)
