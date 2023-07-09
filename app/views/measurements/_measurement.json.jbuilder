json.extract! measurement, :id, :temperature, :humidity, :created_at, :updated_at
json.url measurement_url(measurement, format: :json)
