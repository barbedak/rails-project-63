# frozen_string_literal: true

module HexletCode
  class FormBuilder
    autoload(:StringInput, 'hexlet_code/string_input')
    attr_accessor :form_body, :entity, :tags, :form_options

    def initialize(entity, options)
      @entity = entity
      @tags = []
      @form_options = prepare_options(options)
    end

    def input(name, attributes = {})
      options = {}
      options[:name] = name.to_s
      if attributes.key?(:as)
        tag_name = 'textarea'
        options[:cols] = attributes.fetch(:cols, 20)
        options[:rows] = attributes.fetch(:rows, 40)
      else
        tag_name = 'input'
        options[:type] = 'text'
      end
      options[:value] = @entity.public_send(name)
      options.merge!(attributes) { |_, old, _| old }
      @tags << StringInput.new(tag_name, options)
    end

    def submit(value = 'Save')
      options = {}
      options[:type] = 'submit'
      options[:value] = value
      @tags << StringInput.new('input', options)
    end

    private

    def prepare_options(options)
      opts = {}
      opts[:action] = options.fetch(:url, '#')
      opts[:method] = options.fetch(:method, 'post')
      opts.merge!(options)
      opts.delete(:url)
      opts
    end
  end
end
