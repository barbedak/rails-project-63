# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def html_tag
        Tag.build('input', @input)
      end
    end
  end
end
