# frozen_string_literal: true

# BEGIN
module Model
  def self.included base
    base.extend ClassMethods
  end

  module ClassMethods
    def attribute name, options = {}
      attribute ||= {}
      attribute[name] = options

      attribute.each do |key, target|
        define_method "#{key}" do
          instance_variable_get "@#{key}"
        end

        define_method "#{key}=" do |v|
          case target[:type]
          when :string then value = v.to_s
          when :integer then value = v.to_i
          when :datetime then value = DateTime.parse(v)
          when :boolean then value = v if [true, false].include? v
				  else nil
          end
          instance_variable_set "@#{key}", value
        end
      end
    end
  end

  def initialize params = {}
    @attributes = params.each do |key, val|
      self.instance_variable_get "@#{key}"
        case key
        when :id then value = val.to_i
        when :title, :body then value = val.to_s
        when :created_at then value = DateTime.parse(val)
        when :published then value = val if [true, false].include? val
				else nil
        end
      self.instance_variable_set "@#{key}", value
    end
  end

  def attributes
    @attributes = {
      :id => self.instance_variable_get(:@id),
      :title => self.instance_variable_get(:@title),
      :body => self.instance_variable_get(:@body),
      :created_at => self.instance_variable_get(:@created_at),
      :published => self.instance_variable_get(:@published)
    }
  end
end
# END
