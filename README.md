# README

This application emulate cash register and using Thor for generate CLI for it.

### Installation

Next gems should be installed to make it work: 

* `gem install thor`
* `gem install rspec`

### Add new product to cash register
To add new product to cash register you should add it to constant `PRODUCTS` in file `app/products.rb`.

If newly added product requires discount rule - you need to add new class in `app/discounts` folder 
with name `"Discounts::#{<product_code>}"` and implement discount rule in method `price_with_discount` for it.

### Usage

From terminal go to the project folder and run:
```
ruby cashier_app.rb calculate_total "LIST_OF_PRODUCTS"
```

For example:
```
ruby cashier_app.rb calculate_total "GR1,SR1,CF1"
```
