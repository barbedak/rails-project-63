# frozen_string_literal: true

class FormBuilder # rubocop:disable Style/Documentation
  attr_accessor :form_body, :url, :inputs

  def initialize(url)
    @form_body = {}
    @url = url
    @inputs = []
  end

  def input(name, attributes = {})
    input = {}
    input[:name] = name
    attributes.each do |k, v|
      input[k] = v
    end
    @inputs << input
  end

  def submit(value = "Save")
    @form_body.merge!(submit: value)
  end
end
