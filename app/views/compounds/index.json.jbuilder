json.array!(@compounds) do |compound|
  json.extract! compound, :id, :name, :molecular_formula, :molar_mass, :cas, :structure, :amount, :shelf, :room_number
  json.url compound_url(compound, format: :json)
end
