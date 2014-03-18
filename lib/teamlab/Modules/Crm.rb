module Teamlab
  class Crm

    def initialize
      @request = Teamlab::Request
    end

    def get_all_opportunity_stages
      @request.get(%w(opportunity stage))
    end

    def get_currency_list
      @request.get(%w(settings currency))
    end

    def get_opportunity_list(options = {})
      @request.get(%w(opportunity filter), options)
    end

    def get_result_of_convertation(options = {})
      @request.get(%w(settings currency convert), options)
    end

    def get_opportunity_stage(stage_id)
      @request.get(['opportunity', 'stage', stage_id.to_s])
    end

    def get_opportunity_by_id(id)
      @request.get(['opportunity', id.to_s])
    end

    def get_all_opportunity_contacts(opportunity_id)
      @request.get(['opportunity', opportunity_id.to_s, 'contact'])
    end

    def get_summary_table(currency)
      @request.get(['settings', 'currency', currency.to_s, 'summarytable'])
    end

    def create_opportunity(contact_id, title, responsible_id, options = {})
      @request.post(%w(opportunity), {contactid: contact_id, title: title, responsibleid: responsible_id}.merge(options))
    end

    def create_opportunity_stage(title, color, options = {})
      @request.post(%w(opportunity stage), { title: title, color: color }.merge(options))
    end

    def add_opportunity_contact(opportunity_id, contact_id)
      @request.post(['opportunity', opportunity_id.to_s, 'contact', contact_id.to_s])
    end

    def set_opportunity_success_rights(opportunity_id, is_private, access_list)
      @request.put(%w(opportunity access), opportunityid: opportunity_id, isPrivate: is_private, accessList: access_list)
    end

    def update_opportunity_stage(id, title, color, options = {})
      @request.put(['opportunity', 'stage', id.to_s], { title: title, color: color,  }.merge(options))
    end

    def update_opportunity_stage_order(options = {})
      @request.put(%w(opportunity stage reorder), options)
    end

    def set_opportunity_access_rights(options = {})
      @request.put(%w(opportunity filter access), options)
    end

    def update_opportunity(opportunity_id, contact_id, title, responsible_id, stage_id, options = {})
      @request.put(['opportunity', opportunity_id.to_s], { contactId: contact_id, title: title, responsibleid: responsible_id,
                                                           stageid: stage_id }.merge(options))
    end

    def update_opportunity_stage_color(stage_id, color)
      @request.put(['opportunity', 'stage', stage_id.to_s, 'color'], { color: color })
    end

    def set_rights_to_opportunity(opportunity_id, is_private, access_list)
      @request.put(['opportunity', opportunity_id.to_s, 'access'], { isPrivate: is_private, accessList: access_list })
    end

    def update_opportunity_to_stage(opportunity_id, stage_id)
      @request.put(['opportunity', opportunity_id.to_s, 'stage', stage_id.to_s], stageid: stage_id)
    end

    def delete_opportunity_group(opportunity_ids)
      @request.delete(%w(opportunity), opportunityids: opportunity_ids)
    end

    def delete_opportunity_group_by_filter(options = {})
      @request.delete(%w(opportunity filter), options)
    end

    def delete_opportunity_stage(stage_id)
      @request.delete(['opportunity', 'stage', stage_id.to_s])
    end

    def delete_opportunity(opportunity_id)
      @request.delete(['opportunity', opportunity_id.to_s])
    end

    def delete_opportunity_contact(opportunity_id, contact_id)
      @request.delete(['opportunity', opportunity_id.to_s, 'contact', contact_id.to_s])
    end

    def get_invoice_taxes
      @request.get(%w(invoice tax))
    end

    def get_contacts_for_mail(contact_ids)
      @request.get(%w(contact mail), contactids: contact_ids)
    end

    def get_cases_by_prefix(contact_id, prefix)
      @request.get(%w(case byprefix), contactId: contact_id, prefix: prefix)
    end

    def get_contact_statuses
      @request.get(%w(contact status))
    end

    def get_invoice_sample
      @request.get(%w(invoice sample))
    end

    def get_invoices(options = {})
      @request.get(%w(invoice filter), options)
    end

    def get_contacts(options = {})
      @request.get(%w(contact filter), options)
    end

    def get_settings
      @request.get(%w(invoice settings))
    end

    def get_invoice_items(options = {})
      @request.get(%w(invoiceitem filter), options)
    end

    def get_invoice_by_id(id)
      @request.get(['invoice', id.to_s])
    end

    def get_simple_contacts(options = {})
      @request.get(%w(contact simple filter), options)
    end

    def get_contact_status_by_id(contact_status_id)
      @request.get(['contact', 'status', contact_status_id.to_s])
    end

    def get_entity_invoices(entity_type, entity_id)
      @request.get([entity_type.to_s, 'invoicelist', entity_id.to_s])
    end

    def create_task(title, deadline, responsible_id, category_id, options = {})
      @request.post(%w(task), {title: title, deadline: deadline, responsibleId: responsible_id, categoryId: category_id}.merge(options))
    end

#=========================================== TODO: ПЕРЕМЕННЫЕ ПОШЛИ ПИЗДОЙ =====================================================

    def create_invoice(options = {})
      @request.post(%w(invoice), options)
    end

#=========================================== TODO: ПЕРЕМЕННЫЕ ПОШЛИ ПИЗДОЙ =====================================================

    def create_invoice_line(invoice_id)
      @request.post(%w(invoiceline), invoiceId: invoice_id)
    end

    def create_invoice_item(options = {})
      @request.post(%w(invoiceitem), options)
    end

    def create_invoice_tax(name, description, options = {})
      @request.post(%w(invoice tax), {name: name, description: description}.merge(options))
    end

    def create_contact_type(title, options = {})
      @request.post(%w(contact type), {title: title}.merge(options))
    end

    def create_contact_status(title, color, options = {})
      @request.post(%w(contact status), {title: title, color: color}.merge(options))
    end

    def create_person(first_name, last_name, options = {})
      @request.post(%w(contact person), {firstName: first_name, lastName: last_name}.merge(options))
    end

#=========================================== TODO: ПЕРЕМЕННЫЕ ПОШЛИ ПИЗДОЙ =====================================================

    def create_company(name, options = {})
      @request.post(%w(contact company), {name: name}.merge(options))
    end

    def create_task_group(title, options = {})
      @request.post(%w(contact task group), {title: title}.merge(options))
    end

    def add_tag_to_batch_contacts(tags, options = {})
      @request.post(%w(contact filter taglist), {tags: tags}.merge(options))
    end

    def add_contact_tag_to_group(entity_type, entity_id, tag)
      @request.post([entity_type.to_s, entity_id.to_s, 'tag', 'group'], {tagName: tag})
    end

    def add_deal_to_contact(contact_id, opportunity_id)
      @request.post(['contact', contact_id.to_s, 'opportunity', opportunity_id.to_s])
    end

    def set_is_portal_configured(options = {})
      @request.put(%w(settings), options)
    end

#=========================================== TODO: ПЕРЕМЕННЫЕ ПОШЛИ ПИЗДОЙ =====================================================

    def update_task(task_id, options = {})
      @request.put(['task', task_id.to_s], options)
    end

#=========================================== TODO: ПЕРЕМЕННЫЕ ПОШЛИ ПИЗДОЙ =====================================================

    def update_invoice_item(id, options = {})
      @request.put(['invoiceitem', id.to_s], options)
    end

    def update_invoice_tax(id, name, options = {})
      @request.put(['invoice', 'tax', id.to_s], {name: name}.merge(options))
    end

    def update_contact_type(id, title, options = {})
      @request.put(['contact', 'type', id.to_s], {title: title}.merge(options))
    end

    def update_contact_status(id, options = {})
      @request.put(['contact', 'status', id.to_s], options)
    end

#=========================================== TODO: ПЕРЕМЕННЫЕ ПОШЛИ ПИЗДОЙ =====================================================

    def update_invoice(id, options = {})
      @request.put(['invoice', id], options)
    end

    def update_crm_contact_tag_setting(options = {})
      @request.put(%w(contact tag settings), options)
    end

    def set_access_to_batch_contact(options = {})
      @request.put(%w(contact filter access), options)
    end

    def update_statuses_contact_order(options = {})
      @request.put(%w(contact status reorder), options)
    end

    def save_terms_settings(options = {})
      @request.put(%w(invoice settings terms), options)
    end

    def update_crm_contact_status_settings(options = {})
      @request.put(%w(contact status settings), options)
    end

    def update_invoice_patch_status(status, invoice_ids)
      @request.put(['invoice', 'status', status.to_s], {invoiceids: invoice_ids})
    end

    def update_contact_status_color(id, color)
      @request.put(['contact', 'status', id.to_s, 'color'], color: color)
    end

#=========================================== TODO: ПЕРЕМЕННЫЕ ПОШЛИ ПИЗДОЙ =====================================================

    def update_person(id, options = {})
      @request.put(['contact', 'person', id.to_s], options)
    end

    def update_contact_status_by_id(contact_id, contact_status_id)
      @request.put(['contact', contact_id, 'status'], {contactStatusid: contact_status_id})
    end

    def update_invoice_line(invoice_line_id, invoice_id, options = {})
      @request.put(['invoiceline', invoice_line_id], {invoiceId: invoice_id}.merge(options))
    end



  end
end