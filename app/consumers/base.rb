# frozen_string_literal: true
require './app.rb'
module Consumer
  # :nodoc:
  module Base
    private

    def execute(message)
      begin
        params =  message.fetch(:body, message)
        params = params.with_indifferent_access

        yield(params)
      rescue Exception => e
        AppLogger.logger_instance.error({
          exception: e,
          message: message,
          caller: caller_locations(1, 1)[0].label
          })
      end
    end
  end
end