# frozen_string_literal: true

class FormRender # rubocop:disable Style/Documentation
  attr_accessor :builded_form, :user

  def initialize(user, builded_form)
    @user = user
    @builded_form = builded_form
  end

  def render_html # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    result = "<form action=\"#{@builded_form.url}\" method=\"post\">"
    @builded_form.form_body.each do |field|
      rows = field.fetch(:rows, 40)
      cols = field.fetch(:cols, 20)
      user_name = @user.public_send(field[:name].to_sym)
      result << if field.key?(:as)
                  "<textarea name=\"#{field[:name]}\" cols=\"#{cols}\" rows=\"#{rows}\">#{user_name}</textarea>"
                elsif field.key?(:class)
                  "<input name=\"#{field[:name]}\" type=\"text\" value=\"#{user_name}\" class=\"#{field[:class]}\">"
                else
                  "<input name=\"#{field[:name]}\" type=\"text\" value=\"#{user_name}\">"
                end
    end
    result << "</form>"
  end
end
