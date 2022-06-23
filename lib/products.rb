class Products
  def initialize(products = nil)
    @products = products || DEFAULT_PRODUCTS
  end

  def find(code)
    @products.find { |pr| pr[:code] == code }
  end
end
