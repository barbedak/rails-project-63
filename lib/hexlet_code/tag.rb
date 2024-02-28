# frozen_string_literal: true

# generate tag
module Tag
  SINGLE_TAGS = %w[img br input submit].freeze

  def self.build_label_tag(target)
    "<label for=\"#{target}\">#{target.capitalize}</label>"
  end

  def self.build_single_tag(tag_name, options)
    build_options = options.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
    if options.key?(:as)
      build_double_tag("textarea", options)
    else
      result = options[:type] == "submit" ? "" : build_label_tag(options[:name])
      build_options = [" ", build_options].join if build_options.length.positive?
      [result, "<#{tag_name}", build_options.squeeze(" "), ">"].join
    end
  end

  def self.build_double_tag(tag_name, options)
    build_options = options.map { |key, value| "#{key}=\"#{value}\"" unless %i[type as value].include?(key) }.join(" ")
    build_options = [" ", build_options].join if build_options.length.positive?
    ["<#{tag_name}", build_options.squeeze(" "), ">", options[:value], "</#{tag_name}>"].join
  end

  def self.build(tag_name, options = {})
    if SINGLE_TAGS.include?(tag_name.to_s)
      build_single_tag(tag_name, options)
    else
      build_double_tag(tag_name, options)
    end
  end
end
