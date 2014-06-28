json.array!(@order_ds) do |order_d|
  json.extract! order_d, :id, :order_id, :product_id, :acuerdo, :estado, :cantidad, :desceuento, :precioUnitario, :importeTotal
  json.url order_d_url(order_d, format: :json)
end
