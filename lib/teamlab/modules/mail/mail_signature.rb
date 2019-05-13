module Teamlab
  # Methods for working with mail signatures
  module MailSignature
    def get_meail_signature(mailbox_id)
      @request.get(['signature', mailbox_id.to_s])
    end

    def update_signature(mailbox_id, html, options = {})
      @request.post(['signature', 'update', mailbox_id.to_s], { html: html }.merge(options))
    end
  end
end
