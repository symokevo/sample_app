class ApplicationController < ActionController::Base
  def index
    render html: "Hello, Sample App!"
  end
end
