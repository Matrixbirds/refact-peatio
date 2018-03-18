class ApplicationController < ActionController::Base
    include Authenticate
    protect_from_forgery with: :exception
end
