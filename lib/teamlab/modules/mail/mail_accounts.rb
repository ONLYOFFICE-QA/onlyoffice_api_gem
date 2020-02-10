# frozen_string_literal: true

module Teamlab
  # Methods for working with mail accounts
  module MailAccounts
    def get_account_list
      @request.get(%w[accounts])
    end

    def get_account_by_email(email)
      @request.get(['accounts', email.to_s])
    end

    def get_default_account_settings(email, options = {})
      @request.get(['accounts', email.to_s, 'default'], options)
    end

    def create_account_with_custom_mail_service(name, email, account, password, options = {})
      @request.post(%w[accounts], { name: name, email: email, account: account, password: password }.merge(options))
    end

    def create_oauth_account(email, token, options = {})
      @request.post(%w[accounts oauth], { email: email, token: token }.merge(options))
    end

    def create_account_by_email(email, password)
      @request.post(%w[accounts simple], email: email, password: password)
    end

    def update_account(name, email, password, options = {})
      @request.put(%w[accounts], { name: name, email: email, password: password }.merge(options))
    end

    def set_account_state(email, state)
      @request.put(['accounts', email.to_s, 'state'], state: state)
    end

    def set_account_state_by_mailbox(mailbox_id, email_in_folder)
      @request.put(['accounts', mailbox_id.to_s, 'emailinfolder'], emailInFolder: email_in_folder)
    end

    # Sets the default account specified in the request
    # @param email [String] email of account
    # @param is_default [Boolean] Set or reset account as default
    def set_default_account(email, is_default)
      @request.put(%w[accounts default], email: email, isDefault: is_default)
    end

    def delete_account(email)
      @request.delete(['accounts', email.to_s])
    rescue StandardError
      @request.delete(['accounts'], email: email.to_s) # for version 8.7
    end
  end
end
