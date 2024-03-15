# frozen_string_literal: true

module HexletCode
  class FormRender
    autoload(:Tag, 'hexlet_code/tag')
    attr_reader :builded_form

    def initialize(builded_form)
      @builded_form = builded_form
    end

    def render_html
      submit = @builded_form.form[:submit]
      form_options = @builded_form.form[:form_options].map { |key, value| "#{key}=\"#{value}\"" }.join(' ').strip
      result = ['<form', form_options].join(' ').squeeze(' ')
      result = [result, '>', render_fields].join
      result = [result, submit.html_tag].join if submit
      [result, '</form>'].join
    end

    def render_fields
      result = ''
      @builded_form.form[:inputs].each do |field|
        result = [result, field.add_label, field.html_tag].join
      end
      result
    end
  end
end
