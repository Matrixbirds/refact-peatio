class AuthError < StandardError
    def type
        "auth"
    end
end
