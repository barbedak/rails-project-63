# frozen_string_literal: true

# make form body
class FormBuilder
  attr_accessor :form_body, :user, :tags, :form_options

  def initialize(user, options)
    @user = user
    @tags = []
    @form_options = prepare_options(options)
  end

  def prepare_options(options)
    opts = {}
    opts[:action] = options.fetch(:url, '#')
    opts[:method] = options.fetch(:method, 'post')
    options.each do |key, value|
      opts[key] = value
    end
    opts.map { |key, value| "#{key}=\"#{value}\"" unless key == :url }.join(' ').strip
  end

  def input(name, attributes = {})
    input = {}
    input[:name] = name
    input[:type] = 'text'
    input[:value] = @user.public_send(name)
    attributes.each do |k, v|
      input[k] = v
    end
    @tags << { input: }
  end

  def submit(value = 'Save')
    @tags << { input: { type: 'submit', value: } }
  end
end
