# frozen_string_literal: true

module Teamlab
  # Methods for working with crm contacts methods
  module CrmContacts
    def get_contacts_for_mail(*contact_ids)
      @request.get(%w[contact mail], contactids: contact_ids.flatten)
    end

    def get_contact_statuses
      @request.get(%w[contact status])
    end

    def get_contacts_by_filter(options = {})
      @request.get(%w[contact filter], options)
    end

    def get_simple_contacts(options = {})
      @request.get(%w[contact simple filter], options)
    end

    def get_contact_status_by_id(contact_status_id)
      @request.get(['contact', 'status', contact_status_id.to_s])
    end

    def create_contact_type(title, options = {})
      @request.post(%w[contact type], { title: title }.merge(options))
    end

    def create_contact_status(title, color, options = {})
      @request.post(%w[contact status], { title: title, color: color }.merge(options))
    end

    def create_person(first_name, last_name, options = {})
      @request.post(%w[contact person], { firstName: first_name, lastName: last_name }.merge(options))
    end

    def create_company(company_name, managers, options = {})
      @request.post(%w[contact company], { companyName: company_name, managerList: managers }.merge(options))
    end

    def create_task_group(title, options = {})
      @request.post(%w[contact task group], { title: title }.merge(options))
    end

    def add_tag_to_batch_contacts(tags, options = {})
      @request.post(%w[contact filter taglist], { tags: tags }.merge(options))
    end

    def update_contact_type(id, title, options = {})
      @request.put(['contact', 'type', id.to_s], { title: title }.merge(options))
    end

    def update_contact_status(id, title, options = {})
      @request.put(['contact', 'status', id.to_s], { title: title.to_s }.merge(options))
    end

    def update_crm_contact_tag_setting(options = {})
      @request.put(%w[contact tag settings], options)
    end

    def set_access_to_batch_contact(options = {})
      @request.put(%w[contact filter access], options)
    end

    def update_statuses_contact_order(options = {})
      @request.put(%w[contact status reorder], options)
    end

    def update_crm_contact_status_settings(options = {})
      @request.put(%w[contact status settings], options)
    end

    def update_contact_status_color(status_id, color)
      @request.put(['contact', 'status', status_id.to_s, 'color'], color: color)
    end

    def update_person(id, first_name, last_name, options = {})
      @request.put(['contact', 'person', id.to_s], { firstName: first_name, lastName: last_name }.merge(options))
    end

    def update_contact_status_by_id(contact_id, contact_status_id)
      @request.put(['contact', contact_id, 'status'], contactStatusid: contact_status_id)
    end

    def change_contact_photo(contact_id, photo)
      @request.put(['contact', contact_id.to_s, 'changephoto'], photo: File.new(photo))
    end

    def update_person_and_its_company_status(person_id, contact_status_id)
      @request.put(['contact', 'person', person_id.to_s, 'status'], contactStatusId: contact_status_id)
    end

    def update_company_and_participants_status(company_id, contact_status_id)
      @request.put(['contact', 'company', company_id.to_s, 'status'], contactStatusId: contact_status_id)
    end

    def delete_batch_contacts_by_filter(options = {})
      @request.delete(%w[contact filter], options)
    end

    def delete_contact_status(contact_status_id)
      @request.delete(['contact', 'status', contact_status_id])
    end

    def delete_deal_from_contact(contact_id, opportunity_id)
      @request.delete(['contact', contact_id.to_s, 'opportunity', opportunity_id.to_s])
    end

    def get_all_contact_types
      @request.get(%w[contact type])
    end

    def get_contact_by_id(id)
      @request.get(['contact', id.to_s])
    end

    def get_all_contact_info_types
      @request.get(%w[contact data infotype])
    end

    def get_contacts_by_project_id(id)
      @request.get(['contact', 'project', id.to_s])
    end

    def get_contact_type(id)
      @request.get(['contact', 'type', id.to_s])
    end

    def get_contact_info(contact_id, contact_info_id)
      @request.get(['contact', contact_id.to_s, 'data', contact_info_id.to_s])
    end

    def get_all_categories(info_type)
      @request.get(['contact', 'data', info_type.to_s, 'category'])
    end

    def get_company_linked_persons_list(company_id)
      @request.get(['contact', 'company', company_id.to_s, 'person'])
    end

    # Returns the detailed information about the contacts Email, Phone, Web Site/Social Networks and Address information with the ID
    # @param contactid [String] Contact ID
    # @return [Hash] Contact information
    def get_contact_information(contact_id)
      @request.get(['contact', contact_id.to_s, 'data'])
    end

    def get_contact_information_by_type(contact_id, info_type)
      @request.get(['contact', contact_id.to_s, 'data', info_type.to_s])
    end

    def quick_person_list_creation(data)
      @request.post(%w[contact person quick], data: data)
    end

    def quick_company_list_creation(*names)
      @request.post(%w[contact company quick], companyName: names.flatten)
    end

    def add_contact_info(contact_id, infotype, data, category, options = {})
      @request.post(['contact', contact_id.to_s, 'data'], { infoType: infotype, data: data, category: category }.merge(options))
    end

    def link_contact_list_with_project(project_id, *contact_ids)
      @request.post(['contact', 'project', project_id.to_s], contactId: contact_ids.flatten)
    end

    def add_persons_to_company(company_id, person_id)
      @request.post(['contact', 'company', company_id.to_s, 'person'], personId: person_id)
    end

    def link_contact_with_project(contact_id, project_id)
      @request.post(['contact', contact_id.to_s, 'project', project_id.to_s])
    end

    def add_contact_opportunity(contact_id, opportunity_id)
      @request.post(['contact', contact_id.to_s, 'opportunity', opportunity_id.to_s])
    end

    def delete_contact_group(*contact_ids)
      @request.put(%w[contact], contactids: contact_ids.flatten)
    end
    alias delete_contacts_bulk delete_contact_group

    def merge_contacts(from_contact_id, to_contact_id)
      @request.put(%w[contact merge], fromcontactid: from_contact_id, tocontactid: to_contact_id)
    end

    def set_contacts_access_rights(contact_ids, options = {})
      @request.put(%w[contact access], { contactId: contact_ids }.merge(options))
    end

    def update_contact_types_order(*titles)
      @request.put(%w[contact type reorder], titles: titles.flatten)
    end

    def set_contact_access_rights(contact_id, options = {})
      @request.put(['contact', contact_id.to_s, 'access'], options)
    end

    # Returns access rights to the contact with the ID specified in the request
    # @param contactid [String] Contact ID
    # @return [Array] List of contacts
    def get_contact_access_rights(contact_id)
      @request.get(['contact', contact_id.to_s, 'access'])
    end

    def update_company(company_id, company_name, options = {})
      @request.put(['contact', 'company', company_id.to_s], { companyName: company_name.to_s }.merge(options))
    end

    def update_crm_entity_creation_date(entity_name, entity_id, date = '2007-01-01')
      id_field = "#{entity_name}id".to_sym
      options = {}
      options[id_field] = entity_id.to_s
      options[:creationDate] = date.to_s
      @request.put([entity_name.to_s, entity_id.to_s, 'creationdate'], options)
    end

    def update_crm_entity_modification_date(entity_name, entity_id, date = '2007-01-01')
      id_field = "#{entity_name}id".to_sym
      options = {}
      options[id_field] = entity_id.to_s
      options[:lastModifedDate] = date.to_s
      @request.put([entity_name.to_s, entity_id.to_s, 'lastmodifeddate'], options)
    end

    def update_contact_info(information_id, contact_id, data, options = {})
      @request.put(['contact', contact_id.to_s, 'data', information_id.to_s], { data: data }.merge(options))
    end

    def change_contact_photo_by_url(contact_id, photo_url)
      @request.put(['contact', contact_id.to_s, 'changephotobyurl'], photourl: photo_url)
    end

    def delete_contact(id)
      @request.delete(['contact', id.to_s])
    end

    def delete_contact_type(contact_type_id)
      @request.delete(['contact', 'type', contact_type_id.to_s])
    end

    def delete_contact_info(contact_id, info_id)
      @request.delete(['contact', contact_id.to_s, 'data', info_id.to_s])
    end

    def delete_person_from_company(company_id, person_id)
      @request.delete(['contact', 'company', company_id.to_s, 'person'], personId: person_id)
    end

    def remove_contact_from_project(contact_id, project_id)
      @request.delete(['contact', contact_id.to_s, 'project', project_id.to_s])
    end

    # Adds the address information to the contact with the selected ID
    # @param contactid [String] Contact ID
    # @param address [Hash] Contact address parameters: street, city, state, zip, country, isPrimary
    # @return [Hash] Contact information
    def add_address_info(contact_id, address = {})
      @request.post(['contact', contact_id.to_s, 'addressdata'], { address: address })
    end

    # Updates the address information with the parameters specified in the request for the contact with the selected ID
    # @param contactid [String] Contact ID
    # @param info_id [String] Contact information record ID
    # @param address [Hash] Contact address parameters: street, city, state, zip, country, isPrimary
    # @return [Hash] Contact information
    def update_address_info(contact_id, info_id, address = {})
      @request.put(['contact', contact_id.to_s, 'addressdata', info_id.to_s], { address: address })
    end
  end
end
