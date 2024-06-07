# frozen_string_literal: true

# Module for code to cleanup crm
module CrmCleanup
  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # Remove all data from crm
  def crm_cleanup(api)
    remove_invoices(api)
    remove_contacts(api)
    remove_tags_for_entity(api, 'contact')
    remove_tags_for_entity(api, 'opportunity')
    remove_tags_for_entity(api, 'case')
    remove_cases(api)
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # Remove all crm invoices
  def remove_invoices(api)
    invoices = api.crm.get_invoices_by_filter.body['response']
    invoices_ids = invoices.map { |invoice| invoice['id'] }
    return if invoices_ids.empty?

    api.crm.delete_batch_invoices(invoices_ids)
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # Remove all crm contacts(api)
  def remove_contacts(api)
    contacts = api.crm.get_contacts_by_filter.body['response']
    contact_ids = contacts.map { |contact| contact['id'] }
    return if contact_ids.empty?

    api.crm.delete_contact_group(contact_ids)
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # Remove all crm tags
  def remove_tags_for_entity(api, entity_type)
    logger.info("Start removing all tags for CRM entity: #{entity_type}")
    tags = api.crm.get_tags_for_entity_type(entity_type).body['response']
    while tags.size.positive?
      logger.info("Found #{tags.size} tags for entity: #{entity_type}")
      tags.map { |tag| tag['title'] }.each { |tag_name| api.crm.delete_tag(entity_type, tag_name) }
      tags = api.crm.get_tags_for_entity_type(entity_type).body['response']
    end
    logger.info("Finished removing all tags for CRM for entity: #{entity_type}")
  end

  # Remove all cases
  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void]
  def remove_cases(api)
    logger.info('Start removing all CRM cases')
    cases = api.crm.get_case_list.body['response']
    while cases.size.positive?
      logger.info("Found #{cases.size} cases")
      cases_ids = cases.map { |case_data| case_data['id'] }
      api.crm.delete_case_group(cases_ids)
      cases = api.crm.get_case_list.body['response']
    end
    logger.info('Finished removing all CRM cases')
  end
end
