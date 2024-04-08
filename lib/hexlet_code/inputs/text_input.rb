# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      attr_accessor :cols, :rows

      def initialize(input)
        @cols = input.fetch(:cols, 20)
        @rows = input.fetch(:rows, 40)
        input = input.except(:cols, :rows)
        input[:cols] = @cols
        input[:rows] = @rows
        super(input)
      end

      def html_tag
        Tag.build('textarea', @input)
      end
    end
  end
end
