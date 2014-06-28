json.array!(@books) do |book|
  json.extract! book, :id, :isbn, :nombre, :cantidad, :precio, :categoria_id
  json.url book_url(book, format: :json)
end
