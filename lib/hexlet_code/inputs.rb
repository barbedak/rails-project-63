# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(input)
        @input = input.except(:label)
        @label = input[:name]

        @input.each do |key, value|
          attribute(key)
          method("#{key}=").call(value)
        end
      end

      def add_label
        Tag.build('label', { for: @label, value: @label.capitalize })
      end

      private

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

    class StringInput < BaseInput
      def html_tag
        Tag.build('input', @input)
      end
    end

    class TextInput < BaseInput
      def html_tag
        Tag.build('textarea', @input)
      end
    end
  end
end
