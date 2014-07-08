json.array!(@detail_sales) do |detail_sale|
  json.extract! detail_sale, :id, :sale_id, :cantidad, :precio, :descuento, :total
  json.url detail_sale_url(detail_sale, format: :json)
end
