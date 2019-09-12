# frozen_string_literal: true

module Teamlab
  # Methods for working with mail images
  module MailImages
    def get_trusted_addresses
      @request.get(%w[display_images addresses])
    end

    def add_trusted_address(address)
      @request.post(%w[display_images addresses], addres: address)
    end

    def remove_from_trusted_addresses(address)
      @request.delete(%w[display_images addresses], addres: address)
    end
  end
end
