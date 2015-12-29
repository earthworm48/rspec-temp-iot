class Device < ActiveRecord::Base
	belongs_to :user
	default_scope  { order(:created_at => :desc) }
	# before_save :validates_error

	# def validates_error
	# 	raise ArgumentError if name.length < 4 || name.length > 16
	# 	# byebug
	# 	raise ArgumentError unless name.is_a?(String)
	# 	raise ArgumentError unless address.respond_to?(:to_str) 		
	# end

	def name=(value)
		raise ArgumentError unless value.is_a?(String)
		raise ArgumentError unless value.size >= 4 && value.size <= 16
		super
	end

  def address=(value)
    #^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$
    raise ArgumentError unless value.is_a?(String)
    raise ArgumentError unless /^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$/ =~ value
    super
  end
end
