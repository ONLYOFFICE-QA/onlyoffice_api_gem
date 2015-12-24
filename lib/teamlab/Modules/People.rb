module Teamlab

  class People

    def initialize
      @request = Teamlab::Request.new('people')
    end

    def get_people
      @request.get
    end

    def get_self
      @request.get(['@self'])
    end

    def search_people(query)
      @request.get(['search'], { query: query })
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

    def remind_password(user_id, email)
      @request.get([user_id, 'password'], { email: email })
    end

    def search_with_status(status, query)
      @request.get(['status', status.to_s, 'search'], {query: query.to_s})
    end

    def add_user(is_visitor, email, firstname, lastname, options = {})
      @request.post(nil , { isVisitor: is_visitor, email: email, firstname: firstname, lastname: lastname}.merge(options))
    end

    def active(options = {})
      @request.post(['active'], options)          #требуется запиливание
    end

    def update_contacts(user_id, contacts = {})
      @request.post([user_id, 'contacts'], contacts)
    end

    def send_invite(*user_ids)
      @request.put(['invite'], { userIds: user_ids.flatten })
    end

    def delete(*user_ids)
      @request.put(['delete'], { userIds: user_ids.flatten })
    end

    def update_user(user_id, is_visitor, email, firstname, lastname, options = {})
      @request.put([user_id.to_s], { isVisitor: is_visitor, email: email, firstname: firstname, lastname: lastname}.merge(options) )
    end

    def change_people_type(type, user_ids)
      @request.put(['type', type.to_s], { userIds: user_ids })
    end

    def update_photo(user_id, path)
      @request.put([user_id.to_s, 'photo'], { files: path })
    end

    def change_people_status(status, user_ids)
      @request.put(['status', status], { userIds: user_ids })
    end

    def add_contacts(contacts, user_id)
      @request.put([user_id, 'contacts'], { contacts: contacts })
    end

    def link_account(profile)
      @request.put([%w(thirdparty linkaccount)], { serializedProfile: profile })
    end

    def delete_user(user_id)
      @request.delete([user_id])
    end

    def delete_photo(user_id)
      @request.delete([user_id, 'photo'])
    end

    def delete_contacts(user_id, contacts)
      @request.delete([user_id, 'contacts'], { contacts: contacts })
    end

    def unlink_account(provider)
      @request.delete([%w(thirdparty unlinkaccount)], { provider: provider})
    end
  end
end
