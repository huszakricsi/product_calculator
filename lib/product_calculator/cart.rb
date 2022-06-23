module ProductCalculator
  class Cart
    def initialize
      @cart = {}
    end

    def get_cart
      @cart
    end

    def add(product)
      if @cart[product[:code]]
        @cart[product[:code]][:quantity] += 1
      else
        @cart[product[:code]] = product.merge(quantity: 1)
      end
    end
  end
end
