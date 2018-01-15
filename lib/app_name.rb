class AppName
  def initialize(app, app_name)
    @app = app
    @app_name = app_name
  end
  
  def call(env)
    if env["ORIGINAL_FULLPATH"] == "/"
      ['200', {'Content-Type' => 'text/html'}, ["Test!"]]
    else
      status, headers, response = @app.call(env)
      response_body = (defined?(response.body).nil?) ? '' : response.body
      headers.merge!({'X-App-Name' => "#{@app_name}"})
      [status, headers, [response_body]]
    end
  end
end
