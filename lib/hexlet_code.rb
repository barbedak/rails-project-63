# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:FormRender, 'hexlet_code/form_render')

  def self.form_for(user, options = {}, &)
    builded_form = FormBuilder.new(user, options)
    yield(builded_form) if block_given?
    rendered_form = FormRender.new(user, builded_form)
    rendered_form.render_html
  end
end
