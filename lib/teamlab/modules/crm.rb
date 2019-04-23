require_relative 'crm/crm_cases'
require_relative 'crm/crm_invoices'
module Teamlab
  class Crm
    include CrmCases
    include CrmInvoices

    def initialize
      @request = Teamlab::Request.new('crm')
    end

    # region Opportunity
    def get_all_opportunity_stages
      @request.get(%w[opportunity stage])
    end

    def get_currency_list
      @request.get(%w[settings currency])
    end

    def get_opportunity_list(options = {})
      @request.get(%w[opportunity filter], options)
    end

    def get_result_of_convertation(options = {})
      @request.get(%w[settings currency convert], options)
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
      @request.get(%w[settings currency summarytable], currency: currency)
    end

    def create_opportunity(stage_id, title, responsible_id, options = {})
      options[:bidCurrencyAbbr] ||= 'USD'
      @request.post(%w[opportunity], { stageId: stage_id, title: title, responsibleid: responsible_id }.merge(options))
    end

    def create_opportunity_stage(title, color, options = {})
      @request.post(%w[opportunity stage], { title: title, color: color }.merge(options))
    end

    def add_opportunity_contact(opportunity_id, contact_id)
      @request.post(['opportunity', opportunity_id.to_s, 'contact', contact_id.to_s])
    end

    def set_opportunity_access_rights(opportunity_ids, is_private, *users)
      @request.put(%w[opportunity access], opportunityid: opportunity_ids.to_a.flatten, isPrivate: is_private, accessList: users.flatten)
    end

    def update_opportunity_stage(id, title, color, options = {})
      @request.put(['opportunity', 'stage', id.to_s], { title: title, color: color }.merge(options))
    end

    def update_opportunity_stages_order(options = {})
      @request.put(%w[opportunity stage reorder], options)
    end

    def set_opportunity_access_rights_for_users(options = {})
      @request.put(%w[opportunity filter access], options)
    end

    def update_opportunity(opportunity_id, contact_id, title, responsible_id, stage_id, options = {})
      @request.put(['opportunity', opportunity_id.to_s], { contactId: contact_id, title: title, responsibleid: responsible_id,
                                                           stageid: stage_id }.merge(options))
    end

    def update_opportunity_stage_color(stage_id, color)
      @request.put(['opportunity', 'stage', stage_id.to_s, 'color'], color: color)
    end

    def set_rights_to_opportunity(opportunity_id, is_private, access_list)
      @request.put(['opportunity', opportunity_id.to_s, 'access'], isPrivate: is_private, accessList: access_list)
    end

    def update_opportunity_to_stage(opportunity_id, stage_id)
      @request.put(['opportunity', opportunity_id.to_s, 'stage', stage_id.to_s], stageid: stage_id)
    end

    def delete_opportunity_group(*opportunity_ids)
      @request.put(%w[opportunity], opportunityids: opportunity_ids.flatten)
    end
    alias delete_opportunities_bulk delete_opportunity_group

    def delete_opportunity_group_by_filter(options = {})
      @request.delete(%w[opportunity filter], options)
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

    # endregion

    # region General

    def get_invoice_taxes
      @request.get(%w[invoice tax])
    end

    def get_contacts_for_mail(*contact_ids)
      @request.get(%w[contact mail], contactids: contact_ids.flatten)
    end

    def get_contact_statuses
      @request.get(%w[contact status])
    end

    def get_invoice_sample
      @request.get(%w[invoice sample])
    end

    def get_invoices_by_filter(options = {})
      @request.get(%w[invoice filter], options)
    end

    def get_contacts_by_filter(options = {})
      @request.get(%w[contact filter], options)
    end

    def get_settings
      @request.get(%w[invoice settings])
    end

    def get_invoice_items_by_filter(options = {})
      @request.get(%w[invoiceitem filter], options)
    end

    def get_invoice_by_id(id)
      @request.get(['invoice', id.to_s])
    end

    def get_simple_contacts(options = {})
      @request.get(%w[contact simple filter], options)
    end

    def get_contact_status_by_id(contact_status_id)
      @request.get(['contact', 'status', contact_status_id.to_s])
    end

    def get_entity_invoices(entity_type, entity_id)
      @request.get([entity_type.to_s, 'invoicelist', entity_id.to_s])
    end

    def create_task(title, deadline, responsible_id, category_id, options = {})
      @request.post(%w[task], { title: title, deadline: deadline, responsibleId: responsible_id, categoryId: category_id }.merge(options))
    end

    def create_invoice(number, issue_date, client_id, due_date, language, currency, exchange_rate, terms, invoice_line, options = {})
      @request.post(%w[invoice], { number: number, issueDate: issue_date, contactId: client_id, dueDate: due_date,
                                   language: language, currency: currency, exchangeRate: exchange_rate, terms: terms,
                                   invoiceLines: invoice_line }.merge(options))
    end

    def create_invoice_line(invoice_id, invoice_item_id, options = {})
      @request.post(%w[invoiceline], { invoiceId: invoice_id, invoiceItemId: invoice_item_id }.merge(options))
    end

    def create_invoice_item(title, description, price, stock_keeping_unit, options = {})
      @request.post(%w[invoiceitem], { title: title, description: description, price: price, sku: stock_keeping_unit.to_s }.merge(options))
    end

    def create_invoice_tax(name, description, options = {})
      @request.post(%w[invoice tax], { name: name, description: description }.merge(options))
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

    def add_contact_tag_to_group(entity_type, entity_id, tag)
      @request.post([entity_type.to_s, entity_id.to_s, 'tag', 'group'], tagName: tag)
    end

    def add_deal_to_contact(contact_id, opportunity_id)
      @request.post(['contact', contact_id.to_s, 'opportunity', opportunity_id.to_s])
    end

    def set_is_portal_configured(options = {})
      @request.put(%w[settings], options)
    end

    def save_smtp_settings(options = {})
      @request.put(%w[settings smtp], options)
    end

    def update_crm_currency(currency)
      @request.put(%w[settings currency], currency: currency)
    end

    def update_task(task_id, title, deadline, category_id, options = {})
      @request.put(['task', task_id.to_s], { title: title, deadline: deadline, categoryid: category_id }.merge(options))
    end

    def update_invoice_item(id, title, description, price, stock_keeping_unit, options = {})
      @request.put(['invoiceitem', id.to_s], { title: title, description: description, price: price, sku: stock_keeping_unit.to_s }.merge(options))
    end

    def update_invoice_tax(id, name, options = {})
      @request.put(['invoice', 'tax', id.to_s], { name: name }.merge(options))
    end

    def update_contact_type(id, title, options = {})
      @request.put(['contact', 'type', id.to_s], { title: title }.merge(options))
    end

    def update_contact_status(id, title, options = {})
      @request.put(['contact', 'status', id.to_s], { title: title.to_s }.merge(options))
    end

    #=========================================== TODO: OPTIONAL VARIABLES =====================================================

    def update_invoice(id, options = {})
      @request.put(['invoice', id.to_s], options)
    end

    def update_crm_contact_tag_setting(options = {})
      @request.put(%w[contact tag settings], options)
    end

    def save_number_settings(options = {})
      @request.put(%w[invoice settings name], options)
    end

    def set_access_to_batch_contact(options = {})
      @request.put(%w[contact filter access], options)
    end

    def update_organisation_company_name(title)
      @request.put(%w[settings organisation base], companyName: title)
    end

    def update_organisation_address(text)
      @request.put(%w[settings organisation address], companyAddress: text)
    end

    def update_statuses_contact_order(options = {})
      @request.put(%w[contact status reorder], options)
    end

    def save_terms_settings(options = {})
      @request.put(%w[invoice settings terms], options)
    end

    def update_crm_contact_status_settings(options = {})
      @request.put(%w[contact status settings], options)
    end

    def update_invoice_patch_status(status, invoice_ids)
      @request.put(['invoice', 'status', status.to_s], invoiceids: invoice_ids)
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

    def update_invoice_line(invoice_line_id, invoice_id, options = {})
      @request.put(['invoiceline', invoice_line_id], { invoiceId: invoice_id }.merge(options))
    end

    #=========================================== TODO: MULTIPART-FORM DATA =====================================================

    def change_contact_photo(contact_id, photo)
      @request.put(['contact', contact_id.to_s, 'changephoto'], photo: photo)
    end

    def update_person_and_its_company_status(person_id, contact_status_id)
      @request.put(['contact', 'person', person_id.to_s, 'status'], contactStatusId: contact_status_id)
    end

    def update_company_and_participants_status(company_id, contact_status_id)
      @request.put(['contact', 'company', company_id.to_s, 'status'], contactStatusId: contact_status_id)
    end

    def delete_batch_invoices(*invoice_ids)
      @request.delete(%w[invoice], invoiceids: invoice_ids.flatten)
    end
    alias delete_invoices_bulk delete_batch_invoices

    def delete_batch_items(*ids)
      @request.delete(%w[invoiceitem], ids: ids.flatten)
    end
    alias delete_invoice_items_bulk delete_batch_items

    def delete_batch_contacts_by_filter(options = {})
      @request.delete(%w[contact filter], options)
    end

    def delete_invoice_item(id)
      @request.delete(['invoiceitem', id.to_s])
    end

    def delete_invoice_tax(id)
      @request.delete(['invoice', 'tax', id.to_s])
    end

    def delete_invoice(id)
      @request.delete(['invoice', id.to_s])
    end

    def delete_invoice_line(id)
      @request.delete(['invoiceline', id.to_s])
    end

    def delete_contact_status(contact_status_id)
      @request.delete(['contact', 'status', contact_status_id])
    end

    def delete_deal_from_contact(contact_id, opportunity_id)
      @request.delete(['contact', contact_id.to_s, 'opportunity', opportunity_id.to_s])
    end

    def get_event_list_by_filter(options = {})
      @request.get(%w[history filter], options)
    end

    def get_all_history_categories
      @request.get(%w[history category])
    end

    def create_event(contact_id, content, category_id, options = {})
      @request.post(%w[history], { contactId: contact_id, content: content, categoryId: category_id }.merge(options))
    end

    def create_history_category(title, image_name, options = {})
      @request.post(%w[history category], { title: title.to_s, imageName: image_name.to_s }.merge(options))
    end

    def update_history_category(id, title, options = {})
      @request.put(['history', 'category', id.to_s], { title: title }.merge(options))
    end

    def update_history_categories_order(*titles)
      @request.put(%w[history category reorder], titles: titles.flatten)
    end

    def update_history_category_icon(id, icon_name)
      @request.put(['history', 'category', id.to_s, 'icon'], imageName: icon_name.to_s)
    end

    def delete_event_and_related_files(id)
      @request.delete(['history', id.to_s])
    end

    def delete_history_category(id)
      @request.delete(['history', 'category', id.to_s])
    end

    def get_task_list_by_filter(options = {})
      @request.get(%w[task filter], options)
    end

    def get_all_task_categories
      @request.get(%w[task category])
    end

    def get_task_by_id(task_id)
      @request.get(['task', task_id.to_s])
    end

    def get_task_category(category_id)
      @request.get(['task', 'category', category_id.to_s])
    end

    def create_task_category(title, image_name, options = {})
      @request.post(%w[task category], { title: title.to_s, imageName: image_name.to_s }.merge(options))
    end

    def update_task_category(category_id, title, options = {})
      @request.put(['task', 'category', category_id.to_s], { title: title }.merge(options))
    end

    def close_task(task_id)
      @request.put(['task', task_id.to_s, 'close'])
    end

    def resume_task(task_id)
      @request.put(['task', task_id.to_s, 'reopen'])
    end

    def update_task_categories_order(*titles)
      @request.put(%w[task category reorder], titles: titles.flatten)
    end

    def update_task_category_icon(id, image_name)
      @request.put(['task', 'category', id.to_s, 'icon'], imageName: image_name.to_s)
    end

    def delete_task(id)
      @request.delete(['task', id.to_s])
    end

    def delete_task_category(category_id)
      @request.delete(['task', 'category', category_id.to_s])
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

    def update_company(company_id, company_name, options = {})
      @request.put(['contact', 'company', company_id.to_s], { companyName: company_name.to_s }.merge(options))
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

    def delete_contact_address(contact_id, information_id)
      @request.delete(['contact', contact_id.to_s, 'data', 'address', information_id.to_s])
    end

    def remove_contact_from_project(contact_id, project_id)
      @request.delete(['contact', contact_id.to_s, 'project', project_id.to_s])
    end

    # region Files

    def get_root_folder_id
      @request.get(%w[files root])
    end

    def get_file_list(entity_type, entity_id)
      @request.get([entity_type.to_s, entity_id.to_s, 'files'])
    end

    def associate_file_with_entity(entity_type, entity_id, *fileids)
      @request.post([entity_type, entity_id, 'files'], fileids: fileids.flatten)
    end

    def create_txt(entity_type, entity_id, title, content)
      @request.post([entity_type.to_s, entity_id.to_s, 'files', 'text'], title: title, content: content)
    end

    def upload_file(entity_type, entity_id, file)
      @request.post([entity_type.to_s, entity_id.to_s, 'files', 'upload'], somefile: File.new(file))
    end

    def delete_file(id)
      @request.post(['files', id.to_s])
    end

    def get_tags_for_entity_type(entity_type)
      @request.get([entity_type.to_s, 'tag'])
    end

    def get_all_contact_tags(contact_id)
      @request.get(['contact', contact_id.to_s, 'tag'])
    end

    def get_entity_tags(entity_type, entity_id)
      @request.get([entity_type.to_s, 'tag', entity_id.to_s])
    end

    def create_tag(entity_type, tag_name)
      @request.post([entity_type.to_s, 'tag'], tagName: tag_name)
    end

    #=========================================== TODO: OPTIONAL VARIABLES =====================================================

    def add_tag_to_case_group_by_filter(tag_name, options = {})
      @request.post(%w[case filter taglist], { tagName: tag_name }.merge(options))
    end

    #=========================================== TODO: OPTIONAL VARIABLES =====================================================

    def add_tag_group_to_entity(entity_type, entity_id, tag_name)
      @request.post([entity_type.to_s, 'taglist'], entityId: entity_id, tagName: tag_name)
    end

    #=========================================== TODO: OPTIONAL VARIABLES =====================================================

    def add_tag_to_opportunity_group(tag_name, options = {})
      @request.post(%w[opportunity filter taglist], { tagName: tag_name }.merge(options))
    end

    def add_tag(entity_type, entity_id, tag_name)
      @request.post([entity_type.to_s, entity_id.to_s, 'tag'], tagName: tag_name)
    end

    def delete_tag(entity_type, tag_name)
      @request.delete([entity_type.to_s, 'tag'], tagName: tag_name)
    end

    def delete_unused_tags(entity_type)
      @request.delete([entity_type.to_s, 'tag', 'unused'])
    end

    def remove_tag(entity_type, entity_id, tag_name)
      @request.delete([entity_type.to_s, entity_id.to_s, 'tag'], tagName: tag_name)
    end

    def get_task_template_container_list(entity_type)
      @request.get([entity_type.to_s, 'tasktemplatecontainer'])
    end

    def get_task_template_container(id)
      @request.get(['tasktemplatecontainer', id.to_s])
    end

    def get_task_template(id)
      @request.get(['tasktemplatecontainer', 'tasktemplate', id.to_s])
    end

    def get_task_template_list_by_container_id(id)
      @request.get(['tasktemplatecontainer', id.to_s, 'tasktemplate'])
    end

    def create_task_template_container(entity_type, title)
      @request.post([entity_type.to_s, 'tasktemplatecontainer'], title: title)
    end

    #=========================================== TODO: OPTIONAL VARIABLES =====================================================

    def create_task_template(container_id, title, category_id, options = {})
      @request.post(['tasktemplatecontainer', container_id.to_s, 'tasktemplate'],
                    { title: title, categoryid: category_id }.merge(options))
    end

    def update_task_template_container(container_id, title)
      @request.put(['tasktemplatecontainer', container_id.to_s], title: title)
    end

    #=========================================== TODO: OPTIONAL VARIABLES =====================================================

    def update_task_template(container_id, task_template_id, title, options = {})
      @request.put(['tasktemplatecontainer', container_id.to_s, 'tasktemplate'], { id: task_template_id.to_s, title: title }.merge(options))
    end

    def delete_task_template_container(container_id)
      @request.delete(['tasktemplatecontainer', container_id.to_s])
    end

    def delete_task_template(id)
      @request.delete(['tasktemplatecontainer', 'tasktemplate', id.to_s])
    end

    def get_user_field_values(entity_type, entity_id)
      @request.get([entity_type.to_s, entity_id.to_s, 'customfield'])
    end

    def get_user_field_list(entity_type)
      @request.get([entity_type.to_s, 'customfield', 'definitions'])
    end

    def create_user_field(entity_type, label, field_type, options = {})
      @request.post([entity_type.to_s, 'customfield'], { fieldType: field_type, label: label }.merge(options))
    end

    def set_user_field_value(entity_type, entity_id, field_id, field_value)
      @request.post([entity_type.to_s, entity_id.to_s, 'customfield', field_id.to_s], fieldValue: field_value)
    end

    def update_selected_user_field(entity_type, user_field_id, label, field_type, options = {})
      @request.put([entity_type.to_s, 'customfield', user_field_id.to_s], { fieldType: field_type, label: label }.merge(options))
    end

    def update_user_fields_order(entity_type, *field_ids)
      @request.put([entity_type.to_s, 'customfield', 'reorder'], fieldIds: field_ids.flatten)
    end

    def delete_user_field(entity_type, field_id)
      @request.delete([entity_type.to_s, 'customfield', field_id.to_s])
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

    def get_all_currency_rates
      @request.get(%w[currency rates], {})
    end

    def set_currency_rate(from = 'EUR', to = 'USD', rate = '1.0')
      @request.post(%w[currency rates], fromCurrency: from, toCurrency: to, rate: rate)
    end

    def get_currency_rate_by_id(id)
      @request.get(['currency', 'rates', id.to_s], {})
    end

    def delete_currency_rate_by_id(id)
      @request.delete(['currency', 'rates', id.to_s], {})
    end
  end
end
