class BaseError < StandardError
    attr_reader :status, :message, :reason, :type

    def initialize(message: nil, reason: nil)
        @message = message
        @status = 200
        @reason = reason
    end

    def type
        "base"
    end

    def as_json
        {
            status: status,
            type: type,
            reason: reason
        }
    end

    protected :status, :message, :type
end
