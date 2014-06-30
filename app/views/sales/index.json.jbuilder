json.array!(@sales) do |sale|
  json.extract! sale, :id, :costumer_id, :fecha_venta, :book_id
  json.url sale_url(sale, format: :json)
end
