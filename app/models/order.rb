class Order < ApplicationRecord
  has_many :order_items

  # This method constructs the query based on
  # the passed-in parameters
	def self.candidate_list(params={})
		orders = order(params[:order]).includes(:order_items)
		if params[:max_results].present?
		   orders = orders.limit(params[:max_results].to_i)
		end
		# arr1=[]
		#orders.each do |order|
         #   arr1.push(order) if order.order_items.where("shopify_product_id = ?" params[:product_id]).count >= 1
		#end
		#if params[:product_id].present?
		 #  orders = orders.where("order_items.shopify_product_id" => params[:product_id].to_i)
		#end
		
		if params[:start_date].present?
		   orders = orders.where(["orders.order_date >= ?",params[:start_date]])
		end
		
		if params[:end_date].present?
		   orders = orders.where(["orders.order_date <= ?",params[:end_date]])
		end
		
		# .pluck returns an array containing the specified field
	    return orders.pluck(:id).uniq
    end
end
