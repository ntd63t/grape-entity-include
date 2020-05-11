require 'grape_entity_include/version'
require 'grape_entity'

Grape::Entity.instance_eval do
  def include_attr_path?
    lambda { |instance, options| include_attr_path?(options[:include], options[:attr_path]) }
  end
end
Grape::Entity.class_eval do
  def include_attr_path?(include_params, attr_path)
    return false if !include_params.is_a?(Array) || include_params.empty?
    is_included = false
    sub_attr_path =attr_path.dup
    attr_first = sub_attr_path.shift
    include_params.each do |param|
      if param.is_a?(String) || param.is_a?(Symbol)
        break is_included = true if param.to_s == attr_first.to_s && sub_attr_path.empty?
      elsif param.is_a? Hash
        param.each do |attr, nested_attrs|
          if attr.to_s == attr_first.to_s
            break is_included = true if sub_attr_path.empty?
            break is_included = true if include_attr_path?(nested_attrs, sub_attr_path)
          end
        end
      end
      break true if is_included == true
    end
    is_included
  end
end
