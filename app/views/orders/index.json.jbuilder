json.array!(@orders) do |order|
  json.extract! order, :id, :usuario_id, :cliente_id, :fechaPedido, :fechaEntrega, :fechaRealEntrega, :estado
  json.url order_url(order, format: :json)
end
