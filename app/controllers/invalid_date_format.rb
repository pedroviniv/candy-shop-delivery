class InvalidDateFormat < ArgumentError
	def initialize(msg)
		@msg = msg
	end

	attr_reader :msg
end