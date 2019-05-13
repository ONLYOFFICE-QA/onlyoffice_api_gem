module Teamlab
  # Methods for working with mail helpcenter
  module MailHelpCenter
    def get_html_of_help_center
      @request.get(%w[helpcenter])
    end
  end
end
