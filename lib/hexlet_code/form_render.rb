# frozen_string_literal: true

module HexletCode
  class FormRender
    autoload(:Tag, 'hexlet_code/tag')
    attr_accessor :builded_form, :user

    def initialize(user, builded_form)
      @user = user
      @builded_form = builded_form
    end

    def render_html
      form_options = @builded_form.form_options.map { |key, value| "#{key}=\"#{value}\"" }.join(' ').strip
      result = ['<form', form_options].join(' ').squeeze(' ')
      result = [result, '>'].join
      @builded_form.tags.each do |field|
        result = [result, field.html_tag].join
      end
      result << '</form>'
    end
  end
end
