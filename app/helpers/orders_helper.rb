module OrdersHelper
	def days_period(order_deadline)
		days = (DateTime.parse(order_deadline.to_s) - DateTime.now).to_i
		puts days
		days
	end

	def correspondent_class(order_deadline)
		days = days_period(order_deadline)
		if days < 3
			'is-danger'
		elsif days < 6
			'is-warning'
		else
			'is-success'
		end
	end

	def format(order_deadline)
		order_deadline.strftime("%d/%m/%Y %H:%M:%S")
	end
end
