module Authenticate
    extend ActiveSupport::Concern

    included do
        def current_user
            login_jwt
        end

        def login_with_jwt
        @current_user ||= begin
            token = JWT.decode token
            User.find_by_id token["payload"]["id"]
        end
        rescue JWT::DecodeError => err
            raise AuthError.new message: err, reason: 'authenticate_error'
        end

        def token
            request.headers["Authorization"]&.split("bear token=")[0]
        end

        def clear_session_biz
        end

        def clear_session_state
        end

        def load_token
            payload = { data: { id: current_user } }
            JWT.encode payload, nil, false
        end
    end
end
