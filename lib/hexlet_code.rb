# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode # rubocop:disable Style/Documentation
  class Error < StandardError; end
  autoload(:Tag, "hexlet_code/tag.rb")
  def self.form_for(_user, options = {})
    url = options.fetch(:url, "#")
    "<form action=\"#{url}\" method=\"post\"></form>"
  end
end
