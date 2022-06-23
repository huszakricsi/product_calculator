# Product calculator

## Installation

In order to get the application running you need to do as follows:

- Make sure that you are using a ruby version which is definied in .ruby-version

- Execute: `bundle install`

## Usage

To experiment with that code, run `bin/console` for an interactive prompt.

## TEST

You can run tests by: `rspec`.

You can generate test coverage by setting the SIMPLECOV environment variable to true: `SIMPLECOV=true rspec` which should generate an overview of 100% coverage to the 'coverage' folder.

## Description

Our client is an online marketplace, here is a sample of some of the products available on our site:
| Product code | Name                   | Price  |
|--------------|------------------------|--------|
| 001          | Lavender heart         | $9.25  |
| 002          | Personalised cufflinks | $45.00 |
| 003          | Kids T-shirt           | $19.95 |


Our marketing team want to offer promotions as an incentive for our customers to purchase these items.
If you spend over $60, then you get 10% off of your purchase. If you buy 2 or more lavender hearts then the price drops to $8.50.
Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules.
The interface to our checkout looks like this (shown in Ruby):
```
{
  co = Checkout.new(promotional_rules)
  co.scan(item)
  co.scan(item)
  price = co.total
}
```

Implement a checkout system that fulfills these requirements. Do this outside of any frameworks with showing knowledge of TDD.


This test data is just an example of products and discounts, your system should be ready to accept any kind of product and discount.

Test data

| Basket          | Total price expected |
|-----------------|----------------------|
| 001,002,003     | $66.78               |
| 001,003,001     | $36.95               |
| 001,002,001,003 | $73.76               |

