json.array!(@costumers) do |costumer|
  json.extract! costumer, :id, :rfc, :nombre, :telefono, :facebook, :diraccion, :linkedin, :correoE
  json.url costumer_url(costumer, format: :json)
end
