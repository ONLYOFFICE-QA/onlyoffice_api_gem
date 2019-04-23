module Teamlab
  # Methods for working with crm cases
  module CrmCases
    def get_cases_by_prefix(contact_id, prefix)
      @request.get(%w[case byprefix], contactId: contact_id, prefix: prefix)
    end

    def get_case_list(options = {})
      @request.get(%w[case filter], options)
    end

    def get_case_by_id(id)
      @request.get(['case', id.to_s])
    end

    def get_all_case_contacts(case_id)
      @request.get(['case', case_id.to_s, 'contact'])
    end

    def create_case(title, options = {})
      @request.post(%w[case], { title: title }.merge(options))
    end

    def add_case_contact(case_id, contact_id)
      @request.post(['case', case_id.to_s, 'contact'], contactId: contact_id)
    end

    def set_case_access_rights(case_ids, options = {})
      @request.put(%w[case access], { caseId: case_ids }.merge(options))
    end

    def update_case(case_id, title, options = {})
      @request.put(['case', case_id.to_s], { title: title }.merge(options))
    end

    def set_case_access_rights_by_filter(options = {})
      @request.put(%w[case filter access], options)
    end

    def resume_case(case_id)
      @request.put(['case', case_id.to_s, 'reopen'])
    end

    def close_case(case_id)
      @request.put(['case', case_id.to_s, 'close'])
    end

    def set_rights_to_case(case_id, options = {})
      @request.put(['case', case_id.to_s, 'access'],
                   { casesid: case_id }.merge(options))
    end

    def delete_case_group(*case_ids)
      @request.put(%w[case], casesids: case_ids.flatten)
    end
    alias delete_cases_bulk delete_case_group

    def delete_case_group_by_filter(options = {})
      @request.delete(%w[case filter], options)
    end

    def delete_case(case_id)
      @request.delete(['case', case_id.to_s])
    end

    def delete_case_contact(case_id, contact_id)
      @request.delete(['case', case_id.to_s, 'contact', contact_id.to_s])
    end
  end
end
