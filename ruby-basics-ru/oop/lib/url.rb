# frozen_string_literal: true

# BEGIN
require 'uri'

class Url
  attr :uri

  def initialize(url)
    @uri = URI(url)
  end

  extend Forwardable

  def_delegators :@uri, :scheme, :host, :port

  include Comparable

  def <=>(other_url)
    query_params <=> other_url.query_params && uri.port <=> other_url.port
  end

  def query_params
    unless uri.query.nil?
      Hash[URI::decode_www_form(uri.query)].transform_keys(&:to_sym)
    else
      {}
    end
  end

  def query_param(key, *value)
    if query_params.has_key?(key)
      query_params[key]
    elsif value.any?
      value.join
    else
      nil
    end
  end
end
# END
