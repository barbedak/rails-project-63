# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      def html_tag
        Tag.build('textarea', @input)
      end
    end
  end
end
