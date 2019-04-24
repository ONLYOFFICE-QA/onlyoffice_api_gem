require_relative 'crm/crm_cases'
require_relative 'crm/crm_common'
require_relative 'crm/crm_contacts'
require_relative 'crm/crm_files'
require_relative 'crm/crm_history'
require_relative 'crm/crm_invoices'
module Teamlab
  class Crm
    include CrmCases
    include CrmCommon
    include CrmContacts
    include CrmFiles
    include CrmHistory
    include CrmInvoices

    def initialize
      @request = Teamlab::Request.new('crm')
    end

    # region Opportunity
    def get_all_opportunity_stages
      @request.get(%w[opportunity stage])
    end

    def get_opportunity_list(options = {})
      @request.get(%w[opportunity filter], options)
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

    def create_task(title, deadline, responsible_id, category_id, options = {})
      @request.post(%w[task], { title: title, deadline: deadline, responsibleId: responsible_id, categoryId: category_id }.merge(options))
    end

    def add_contact_tag_to_group(entity_type, entity_id, tag)
      @request.post([entity_type.to_s, entity_id.to_s, 'tag', 'group'], tagName: tag)
    end

    def add_deal_to_contact(contact_id, opportunity_id)
      @request.post(['contact', contact_id.to_s, 'opportunity', opportunity_id.to_s])
    end

    def save_smtp_settings(options = {})
      @request.put(%w[settings smtp], options)
    end

    def update_task(task_id, title, deadline, category_id, options = {})
      @request.put(['task', task_id.to_s], { title: title, deadline: deadline, categoryid: category_id }.merge(options))
    end

    #=========================================== TODO: OPTIONAL VARIABLES =====================================================

    def update_organisation_company_name(title)
      @request.put(%w[settings organisation base], companyName: title)
    end

    def update_organisation_address(text)
      @request.put(%w[settings organisation address], companyAddress: text)
    end

    #=========================================== TODO: MULTIPART-FORM DATA =====================================================

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
    # region Files

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
  end
end
