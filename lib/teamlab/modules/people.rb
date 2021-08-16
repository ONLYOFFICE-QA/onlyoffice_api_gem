# frozen_string_literal: true

require_relative 'people/people_reassign'
module Teamlab
  class People
    include PeopleReassign

    def initialize(config = nil)
      @request = Teamlab::Request.new(config, 'people')
    end

    def get_people
      @request.get
    end

    def get_self
      @request.get(['@self'])
    end

    def search_people(query)
      @request.get(['search'], query: query)
    end

    def filter_people(filters)
      @request.get(['filter'], filters)
    end

    def get_user_by_username(username)
      @request.get([username.to_s])
    end

    def get_people_by_status(status)
      @request.get(['status', status])
    end

    def get_people_by_search_query(query)
      @request.get(['@search', query])
    end

    def search_with_status(status, query)
      @request.get(['status', status.to_s, 'search'], query: query.to_s)
    end

    def add_user(is_visitor, email, firstname, lastname, options = {})
      @request.post(nil, { isVisitor: is_visitor, email: email, firstname: firstname, lastname: lastname }.merge(options))
    end

    def update_contacts(user_id, contacts = {})
      @request.post([user_id, 'contacts'], contacts)
    end

    def send_invite(*user_ids)
      @request.put(['invite'], userIds: user_ids.flatten)
    end

    def delete(*user_ids)
      @request.put(['delete'], userIds: user_ids.flatten)
    end

    def update_user(user_id, is_visitor, email, firstname, lastname, options = {})
      @request.put([user_id.to_s], { isVisitor: is_visitor, email: email, firstname: firstname, lastname: lastname }.merge(options))
    end

    def change_people_type(type, user_ids)
      @request.put(['type', type.to_s], userIds: user_ids)
    end

    def update_photo(user_id, path)
      @request.put([user_id.to_s, 'photo'], files: path)
    end

    def change_people_status(status, user_ids)
      @request.put(['status', status], userIds: user_ids)
    end

    def add_contacts(contacts, user_id)
      @request.put([user_id, 'contacts'], contacts: contacts)
    end

    def link_account(profile)
      @request.put([%w[thirdparty linkaccount]], serializedProfile: profile)
    end

    def delete_user(user_id)
      @request.delete([user_id])
    end

    def delete_photo(user_id)
      @request.delete([user_id, 'photo'])
    end

    def delete_contacts(user_id, contacts)
      @request.delete([user_id, 'contacts'], contacts: contacts)
    end

    def unlink_account(provider)
      @request.delete([%w[thirdparty unlinkaccount]], provider: provider)
    end

    # Return the detailed information about the profile of the user with the email specified in the request
    # @param email [String] User email
    # @return [Hash] result user search by email
    def get_user_by_email(email)
      @request.get(['email'], email: email)
    end

    # Get user photos
    # @param userid [String] User ID
    # @return [Hash] result user photos
    def get_user_photoes(user_id)
      @request.get([user_id, 'photo'])
    end

    # Send instructions for delete user own profile
    # @return [Void] send `Deletion of your profile` letter
    def send_delete_instruction
      @request.put(%w[self delete])
    end

    # Join to affiliate programme
    # @return [String] link to affiliate programme
    def join_to_affiliate_programme
      @request.put(%w[self joinaffiliate])
    end
  end
end
