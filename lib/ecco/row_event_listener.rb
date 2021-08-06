require "ecco/event_listener"
require "ecco/row_event"

module Ecco
  class RowEventListener < EventListener
    attr_accessor :data

    def initialize(client)
      super(client, events_of_interest)
    end

    # java to ruby
    def on_event(event)
      @callback.call(event)
    end

    private

    def events_of_interest
      [WRITE_EVENTS, UPDATE_EVENTS, DELETE_EVENTS]
    end
  end
end
