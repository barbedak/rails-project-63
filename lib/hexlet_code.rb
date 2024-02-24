# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/formbuilder"
require_relative "hexlet_code/formrender"

module HexletCode # rubocop:disable Style/Documentation
  class Error < StandardError; end
  autoload(:Tag, "hexlet_code/tag.rb")
  attr_accessor :user

  def self.form_for(user, options = {}, &block) # rubocop:disable Lint/UnusedMethodArgument
    builded_form = FormBuilder.new(options.fetch(:url, "#"))
    yield(builded_form) if block_given?
    rendered_form = FormRender.new(user, builded_form)
    rendered_form.render_html
  end
end
