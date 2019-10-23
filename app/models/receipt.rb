class Receipt < ApplicationRecord
	has_many :receipt_items
	belongs_to :user


	enum settlement:{銀行振込: 0, クレジットカード払い: 1, 代引き払い: 2}
	enum status:{受付: 0, 準備中: 1, 配送済み: 2}

	def total_price_without_tax
		sum = 0
		self.receipt_items.each do |item|
			sum += item.price
		end
		return sum
	end

	def tax_price
		sum = 0
		self.receipt_items.each do |item|
			sum += item.price
		end
		(sum*1.1)-sum
	end

	def total_price_with_tax
		sum = 0
		self.receipt_items.each do |item|
			sum += item.price
		end
		return sum*1.1+500
	end

	def total_price_with_tax_for_cart
		sum= 0
		self.cart_items.each do |item|
			sum += item.price
		end
		return sum*1.1+500
	end
end
