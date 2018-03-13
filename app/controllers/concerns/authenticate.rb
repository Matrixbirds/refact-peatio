module Authenticate
    extend ActiveSupport::Concern

    included do
        def current_user
            login_jwt
        end

        def login_jwt
            @token ||= JWT.decode token
        end

        def token
            request.headers["Authorization"]&.split("bear token=")[0]
        end
    end

    class_methods do
    end
end
