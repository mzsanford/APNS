module APNS
  class Status
    attr_reader :code, :text

    @@status_by_code = {}

    def self.status_for_code(code)
      @@status_by_code[code] || ASPN::Error::UnknownError
    end

    def initialize(code, text)
      @code = code
      @text = text

      @@status_by_code[code] = self
    end

    def error?
      code != 0
    end

    def to_s
      "Error #{@code}: #{@text}"
    end

    def ==(other)
      if other && other.kind_of?(APNS::Status)
        self.code == other.code
      else
        super
      end
    end
  end

  Success = ::APNS::Status.new(0, "Success")
  ProcessingError = ::APNS::Status.new(1, "Processing error")
  MissingDeviceError = ::APNS::Status.new(2, "Missing device token")
  MissingTopicError = ::APNS::Status.new(3, "Missing topic")
  MissingPayloadError = ::APNS::Status.new(4, "Missing payload")
  InvalidTokenSizeError = ::APNS::Status.new(5, "Invalid token size")
  InvalidTopicSizeError = ::APNS::Status.new(6, "Invalid topic size")
  InvalidPayloadSizeError = ::APNS::Status.new(7, "Invalid payload size")
  InvalidTokenError = ::APNS::Status.new(8, "Invalid token")
  ShutdownError = ::APNS::Status.new(10, "Shutdown")
  UnknownError = ::APNS::Status.new(255, "None (unknown)")
end
