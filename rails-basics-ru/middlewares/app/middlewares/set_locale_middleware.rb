# frozen_string_literal: true

class SetLocaleMiddleware
  def initialize(app)
    @app = app
  end

  # BEGIN
  def call(env)
    dup._call(env)
  end

  def _call(env)
    Rails.logger.debug "* Accept language: #{env['HTTP_ACCEPT_LANGUAGE']}"
    locale = switch_locale(env)
    Rails.logger.debug "* Locale set to '#{locale}'"

    @status, @headers, @response = @app.call(env)
    [@status, @headers, @response]
  end

  private

  def switch_locale(env)
    I18n.locale = extract_locale_from_accept_language_header(env) || I18n.default_locale
  end

  def extract_locale_from_accept_language_header(env)
    return if env['HTTP_ACCEPT_LANGUAGE'].blank?

    env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
  # END
end
