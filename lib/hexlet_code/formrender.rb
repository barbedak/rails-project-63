# frozen_string_literal: true

# render form
class FormRender
  autoload(:Tag, 'hexlet_code/tag')
  attr_accessor :builded_form, :user

  def initialize(user, builded_form)
    @user = user
    @builded_form = builded_form
  end

  def render_html
    result = ['<form', @builded_form.form_options].join(' ').squeeze(' ')
    result = [result, '>'].join
    @builded_form.tags.each do |field|
      k, v = field.first
      result << Tag.build(k, v)
    end
    result << '</form>'
  end
end
