# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode # rubocop:disable Style/Documentation
  class Error < StandardError; end
  autoload(:Tag, "hexlet_code/tag.rb")
  attr_accessor :user

  def self.form_for(user, options = {}, &block) # rubocop:disable Lint/UnusedMethodArgument
    @user = user
  attr_accessor :user

  def self.form_for(user, options = {}, &block) # rubocop:disable Lint/UnusedMethodArgument
    @user = user
    url = options.fetch(:url, "#")
    output = "<form action=\"#{url}\" method=\"post\">"
    output << yield(self) if block_given?
    output.concat("</form>")
  end

  def self.input(field_name, options = {}) # rubocop:disable Metrics/MethodLength
    as = options.fetch(:as, false)
    if as
      cols = options.fetch(:cols, false)
      rows = options.fetch(:rows, false)
      output = "<textarea name=\"#{field_name}\" "
      output << if cols
                  "cols=\"#{cols}\" "
                else
                  "cols=\"20\" "
                end
      output << if rows
                  "rows=\"#{rows}\""
                else
                  "rows=\"20\""
                end
      output << ">#{@user.public_send(field_name.to_sym)}</textarea>"
    else
      output = "<input name=\"#{field_name}\" type=\"text\" value=\"#{@user.public_send(field_name.to_sym)}\""
      klass = options.fetch(:class, false)
      output << "class=\"#{klass}\"" if klass
      output << ">"
    end
    output
  end
end
