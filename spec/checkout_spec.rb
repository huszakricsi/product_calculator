require "product_calculator"

describe ProductCalculator::Checkout do
  it "Total price discount" do
    co = ProductCalculator::Checkout.new
    co.scan('001')
    co.scan('002')
    co.scan('003')
    expect(co.total).to eq '$66.78'
  end

  it "Product discount" do
    co = ProductCalculator::Checkout.new
    co.scan('001')
    co.scan('003')
    co.scan('001')
    expect(co.total).to eq '$36.95'
  end

  it "Product discount and total discount" do
    co = ProductCalculator::Checkout.new
    co.scan('001')
    co.scan('002')
    co.scan('001')
    co.scan('003')
    expect(co.total).to eq '$73.76'
  end

  it "Wrong product scanned" do
    co = ProductCalculator::Checkout.new
    expect(co.scan('000')).to eq 'Product not exist'
  end

  it "No products scanned" do
    co = ProductCalculator::Checkout.new
    expect(co.total).to eq '$0.00'
  end
end
