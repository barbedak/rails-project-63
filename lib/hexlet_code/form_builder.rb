# frozen_string_literal: true

module HexletCode
  class FormBuilder
    autoload(:Inputs, 'hexlet_code/inputs.rb')
    attr_reader :form

    def initialize(entity, options)
      @entity = entity
      @action = options.fetch(:url, '#')
      @method = options.fetch(:method, 'post')
      @form = {
        inputs: [],
        submit: nil,
        form_options: { action: @action, method: @method }.merge(options.except(:url))
      }
    end

    def input(name, attributes = {})
      options = { name: name.to_s, type: '', value: @entity.public_send(name) }
      if attributes.key?(:as)
        options[:cols] = attributes.fetch(:cols, 20)
        options[:rows] = attributes.fetch(:rows, 40)
        options.merge!(attributes) { |_, old, _| old }
        input = Inputs::TextInput.new(options)
      else
        options[:type] = 'text'
        options.merge!(attributes) { |_, old, _| old }
        input = Inputs::StringInput.new(options)
      end
      @form[:inputs] << input
    end

    def submit(value = 'Save')
      @form[:submit] = Inputs::StringInput.new({ type: 'submit', value: })
    end
  end
end
