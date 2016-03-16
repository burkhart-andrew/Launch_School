
PRODUCTS = [{
  :name => "Dell Inspiron",
  :price => 350
}]

query = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  price_range = (query[:price_min]..query[:price_max])
  selected_product = PRODUCTS.select do |element|
    element[:name].downcase.include?(query[:q]) && price_range.include?(element[:price])
  end
  selected_product
end