# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, body = @app.call(env)
    sha256 = Digest::SHA256.hexdigest(body.join)
    body.push(sha256)

    [status, headers, body]
    # END
  end
end
