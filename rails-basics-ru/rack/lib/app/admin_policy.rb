# frozen_string_literal: true

class AdminPolicy
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    request = Rack::Request.new(env)

    return [403, {}, []] if request.path.match(%r{/admin/*})

    @app.call(env)
    # END
  end
end
