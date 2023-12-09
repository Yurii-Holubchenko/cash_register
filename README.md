# README

This application emulate cash register and using Thor for generate CLI for it.

### Installation

Next gems should be installed to make it work: 

* `gem install thor`
* `gem install rspec`

### Usage

From terminal go to the project folder and run:
```
ruby cashier.rb calculate_total "LIST_OF_PRODUCTS"
```

For example:
```
ruby cashier.rb calculate_total "GR1,SR1,CF1"
```

Remember - It is important to put the list of products in quotes.
