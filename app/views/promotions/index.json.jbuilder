json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :Fecha, :Cliente, :Medio, :Descripcion, :Empleado
  json.url promotion_url(promotion, format: :json)
end
