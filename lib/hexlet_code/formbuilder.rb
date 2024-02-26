# frozen_string_literal: true

# make form body
class FormBuilder
  attr_accessor :form_body, :url, :user, :tags

  def initialize(url, user)
    @url = url
    @tags = []
    @user = user
  end

  def input(name, attributes = {})
    input = {}
    input[:name] = name
    input[:type] = "text"
    input[:value] = @user.public_send(name)
    attributes.each do |k, v|
      input[k] = v
    end
    @tags << { input: input }
  end

  def submit(value = "Save")
    @tags << { input: { type: "submit", value: value } }
  end
end
