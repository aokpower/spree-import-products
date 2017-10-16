# Spreadsheet Format

ALL HEADERS NEED TO BE LOWERCASE!

## Headers
- [sku](#sku)
- [name](#name)
- [description](#description)
- [cost price](#cost-price)
- [price](#price)
- [Taxonomies](#taxonomies)
- [Meta Title](#meta-title)
- [Meta Description](#meta-description)
- [Meta Keywords](#meta-keywords)
- [slug](#slug)
- [Tax Category id](#tax-category-id)
- [Shipping Category id](#shipping-category-id)

### SKU
Nothing special going on here

### Name
Nothing special going on here

### Brand
Should just be the brand name on its own. This needs to get processed through the csvp tool if it's changed.

### Description
Nothing special going on here

### Cost Price
The cost of the product

### Price
The price of the product

### Taxonomies
Formatted like this: "Categories>Power Tools>Saws|Promotions>Featured"
Make sure everything is capitalized correctly, for now it's case sensitive so it will create new (wrong) taxons if you don't

### Meta Title
Nothing special going on here

### Meta Description
Nothing special going on here

### Slug
This is taken care of by the exporter, don't touch this yourself.

### Tax Category id
An number corresponding to an internal Spree tax category ID

### Shipping Category id
An number corresponding to an internal Spree shipping category ID