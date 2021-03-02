# frozen_string_literal: true

require './inventory_data'

module InventoryProcessor
  extend self

  def product_most_in_stock
    # TODO: complete this method
    InventoryData.products.max_by { |product| product[:instock_count] }
  end

  def inventory_clusters
    # TODO: complete this method
    InventoryData.products.group_by { |product| product[:categories] }.values
  end

  def recommend_products(max_calories)
    # TODO: complete this method
    products = InventoryData.products
    size = products.length / 2
    (1..size).to_a.shuffle.each do |n|
      products.combination(n).to_a.shuffle.each do |product_combo|
        next unless product_combo.map { |product| product[:serving_calories] }.sum <= max_calories

        return product_combo
      end
    end
  end
end
