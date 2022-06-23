module ProductCalculator
  class Checkout
    def initialize(promotions = nil, products = nil)
      @promotions = promotions || DEFAULT_PROMOTIONS
      @products = Products.new(products)
      @cart = Cart.new
    end

    def scan(code)
      product = @products.find(code)
      return 'Product not exist' unless product

      @cart.add(product)
    end

    def total
      cart = @cart.get_cart

      # Apply products promotions
      cart = products_promotions(cart)

      # Get total
      total = cart.map { |_code, product| product[:quantity] * product[:price] }.sum

      # Apply total promotions
      total = total_promotions(total)

      "$#{'%.2f' % total}"
    end

    private

    def products_promotions(cart)
      cart.each do |code, product|
        promotion = @promotions.dig(:products, code)
        cart[code][:price] = promotion[:price] if promotion && product[:quantity] >= promotion[:min_quantity]
      end

      cart
    end

    def total_promotions(total)
      @promotions[:total]&.each do |promotion|
        if promotion[:treshold] <= total
          total -= total * promotion[:discount]
          break
        end
      end
      total
    end
  end
end