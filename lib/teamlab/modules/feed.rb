# frozen_string_literal: true

module Teamlab
  class Feed
    def initialize
      @request = Teamlab::Request.new('feed')
    end

    # TODO: find out how it should work api.onlyoffice.com missing documentation
    def filter_feed(filters)
      @request.get(['filter'], filters)
    end

    def new_feeds_count
      @request.get(['newfeedscount'])
    end

    # TODO: find out how it should work api.onlyoffice.com missing documentation
    def read_feed
      @request.put(['read'])
    end
  end
end
