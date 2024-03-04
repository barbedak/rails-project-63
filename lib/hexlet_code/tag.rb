# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[img br input submit].freeze

    def self.build_single_tag(tag_name, options)
      build_options = options.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      build_options = [' ', build_options].join if build_options.length.positive?
      ["<#{tag_name}", build_options.squeeze(' '), '>'].join
    end

    def self.build_double_tag(tag_name, options)
      build_options = options.except(:type, :as, :value).map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      build_options = [' ', build_options].join if build_options.length.positive?
      ["<#{tag_name}", build_options.squeeze(' '), '>', options[:value], "</#{tag_name}>"].join
    end

    def self.build(tag_name, options = {})
      if SINGLE_TAGS.include?(tag_name.to_s)
        build_single_tag(tag_name, options)
      else
        build_double_tag(tag_name, options)
      end
    end
  end
end
