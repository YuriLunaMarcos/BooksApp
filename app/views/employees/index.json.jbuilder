json.array!(@employees) do |employee|
  json.extract! employee, :id, :nombre
  json.url employee_url(employee, format: :json)
end
