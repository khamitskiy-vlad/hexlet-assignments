# frozen_string_literal: true

# BEGIN
module Model
	require 'Time'

	def self.included(base)
		def base.attribute(name, options = {})
			@attribute ||= []
			@attribute.push(name, options)
			@@attributed = Hash[*@attribute]
		end


		def initialize(params = {})
			@attributes = params
			if @attributes.has_key?(:created_at)
				@attributes = @attributes.merge(created_at: DateTime.parse(@attributes[:created_at]))
			end

			@attributes.each do |key, value|
				self.instance_variable_set "@#{key}", value
				self.instance_variable_get "@#{key}"
			end
		end

		attr_accessor :attributes, :id, :title, :body, :created_at, :published  
	end
end
# END
