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

    def get_tag_list
      @request.get(%w(tags))
    end

    def create_tag(name, options = {})
      @request.post(%w(tags), {name: name}.merge(options))
    end

  end
end

