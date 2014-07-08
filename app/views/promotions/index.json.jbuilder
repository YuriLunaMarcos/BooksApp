json.array!(@promotions) do |promotion|
  json.extract! promotion, :id, :costumer_id, :employee_id, :fecha, :descripcion
  json.url promotion_url(promotion, format: :json)
end
