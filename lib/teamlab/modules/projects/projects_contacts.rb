module Teamlab
  # Module for projects contacts methods
  module ProjectsContacts
    def get_projects_for_contact(contact_id)
      @request.get(['contact', contact_id.to_s])
    end

    def add_project_contact(project_id, contact_id)
      @request.post([project_id.to_s, 'contact'], contactId: contact_id)
    end

    def delete_project_contact(project_id, contact_id)
      @request.delete([project_id.to_s, 'contact'], contactId: contact_id)
    end
  end
end
