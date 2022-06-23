require "bigdecimal" # In these cases, it's better to use decimal than float, since we are going for precision, instead of the speed of the calculation.

DEFAULT_PROMOTIONS = {
  products: {
    '001' => { min_quantity: 2, price: BigDecimal("8.5") }
  },
  total: [ # Total promotions must be ordered by treshold descending
    { treshold: 60, discount: BigDecimal("0.1") }
  ]
}

DEFAULT_PRODUCTS = [
  { code: '001', name: 'Lavender heart', price: BigDecimal("9.25") },
  { code: '002', name: 'Personalised cufflinks', price: BigDecimal("45") },
  { code: '003', name: 'Kids T-shirt', price: BigDecimal("19.95") }
]
