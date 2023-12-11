# README

This application emulate cash register and using Thor for generate CLI for it.

### Installation

Next gems should be installed to make it work: 

* `gem install thor`
* `gem install rspec`
* `gem install pstore`

### Add new product and price for it to cash register system
To add new product to cash register system you should add it to constant `PRODUCTS` in file `app/products.rb`.
In format `{"<product_code>" => {price: <product_price>, name: "<product_name>"}}`

If newly added product requires discount rule - you need to add new class in `app/discounts` folder 
with name `"Discounts::#{<product_code>}"` and implement discount rule in method `price_with_discount` for it.

Products without discounts will be calculated by default rule `price * quantity`.

### Usage

From terminal go to the project folder and run:
```
ruby cashier_app.rb add_products "LIST_OF_PRODUCTS"
ruby cashier_app.rb calculate_total
```

It is possible to add one or multiple products in the cart and then calculate total price for the cart.\
For example:
```
ruby cashier_app.rb add_products "GR1"
ruby cashier_app.rb add_products "SR1,CF1"
ruby cashier_app.rb calculate_total
```

If some of the products is not registered in the system - it will shown an error in terminal -
`Cart include invalid products: GS1`.
