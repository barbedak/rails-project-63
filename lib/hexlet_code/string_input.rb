# frozen_string_literal: true

module HexletCode
  class StringInput
    autoload(:Tag, 'hexlet_code/tag')
    attr_accessor :tag_name

    def initialize(tag_name, options)
      @tag_name = tag_name
      options.each do |key, value|
        attribute(key)
        method("#{key}=").call(value)
      end
    end

    def html_tag
      options = attributes
      options.delete(:tag_name)
      tag_name = attributes[:tag_name]
      result = add_label(options[:name]) unless options[:type] == 'submit'
      if Tag::SINGLE_TAGS.include?(tag_name.to_s)
        [result, Tag.build_single_tag(tag_name.to_s, options)].join
      else
        [result, Tag.build_double_tag(tag_name.to_s, options)].join
      end
    end

    private

    def add_label(name)
      Tag.build_double_tag('label', { for: name, value: name.capitalize })
    end

    def attribute(name)
      define_singleton_method(name.to_s) do
        instance_variable_get("@#{name}")
      end
      define_singleton_method("#{name}=") do |value|
        instance_variable_set "@#{name}", value
      end
    end

    def attributes
      attributes = {}
      instance_variables.each do |attr|
        name = attr.to_s[1..].to_sym
        attributes[name] = method(name).call
      end
      attributes
    end
  end
end
