# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    start = Time.now
    status, headers, body = @app.call(env)
    finish = Time.now
    puts execute_time_for(start, finish)

    [status, headers, body]
  end

  def execute_time_for(start, finish)
    ((finish - start) * 1000.0).to_s
  end
end
