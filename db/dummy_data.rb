def products
  10.times do |index|
    name =
    Product.create(
      name:             "test#{ index + 1 }",
      price:            "#{ ( index + 1 ) * 5000 }",
      description:      "これは#{ index + 1 }個目の商品です。",
      status:           '1',
      charge:           '1',
      shipping_method:  '1',
      shipping_area:    '1',
      shipping_date:    '1',
      size:             '1',
      buyer_id:         '1',
      exhibitor_id:     '1'
    )
  end
end

products