module Teamlab
  class Mail

    def initialize
      @request = Teamlab::Request.new('mail')
    end

    def get_message(id, options = {})
      @request.get(['messages', id.to_s], options)
    end

    def get_account_list
      @request.get(%w(accounts))
    end

    def create_account_by_email(email, password)
      @request.post(%w(accounts simple), {email: email, password: password})
    end

    def delete_account(email)
      @request.delete(['accounts', email.to_s])
    end

    #region Tags

    def get_tag_list
      @request.get(%w(tags))
    end

    def create_tag(name, options = {})
      @request.post(%w(tags), {name: name}.merge(options))
    end

    def update_tag(id, name, options = {})
      @request.put(['tags', id.to_s], {name: name}.merge(options))
    end

    def set_tag_to_messages(id, *message_ids)
      @request.put(['tags', id.to_s, 'set'], messages: message_ids.flatten)
    end

    def remove_tag_from_messages(id, *message_ids)
      @request.put(['tags', id.to_s, 'remove'], messages: message_ids.flatten)
    end

    def delete_tag(id)
      @request.delete(['tags', id.to_s])
    end

    #endregion
  end
end

