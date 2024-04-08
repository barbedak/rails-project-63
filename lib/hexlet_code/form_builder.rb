# frozen_string_literal: true

module HexletCode
  class FormBuilder
    autoload(:Inputs, 'hexlet_code/inputs.rb')
    attr_reader :form

    EXCLUDED_KEYS = [:as].freeze

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
      options[:type] = attributes[:as] || 'string'
      attributes = attributes.reject { |key| EXCLUDED_KEYS.include?(key) }
      options.merge!(attributes) { |_, old, _| old }
      input = "HexletCode::Inputs::#{options[:type].capitalize}Input".constantize.new(options)
      @form[:inputs] << input
    end

    def submit(value = 'Save')
      @form[:submit] = Inputs::StringInput.new({ type: 'submit', value: })
    end
  end
end
