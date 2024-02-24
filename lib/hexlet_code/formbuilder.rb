# frozen_string_literal: true

class FormBuilder # rubocop:disable Style/Documentation
  attr_accessor :form_body, :url

  def initialize(url)
    @form_body = []
    @url = url
  end

  def input(name, attributes = {})
    input = {}
    input[:name] = name
    attributes.each do |k, v|
      input[k] = v
    end
    @form_body << input
  end
end
