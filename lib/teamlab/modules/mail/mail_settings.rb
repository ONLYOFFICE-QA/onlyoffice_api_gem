# frozen_string_literal: true

module Teamlab
  # Methods for working with mail settings
  module MailSettings
    # @param enabled [True, False] set value of always display image
    # @return [Void]
    def set_always_display_images(enabled = true)
      @request.put(%w[settings alwaysDisplayImages], enabled: enabled.to_s)
    end

    # @return [True, False] get value of flag for dispay images
    def always_display_images
      @request.get(%w[settings alwaysDisplayImages])
    end
  end
end
