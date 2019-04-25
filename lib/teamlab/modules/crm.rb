require_relative 'crm/crm_cases'
require_relative 'crm/crm_common'
require_relative 'crm/crm_contacts'
require_relative 'crm/crm_files'
require_relative 'crm/crm_history'
require_relative 'crm/crm_invoices'
require_relative 'crm/crm_opportunities'
require_relative 'crm/crm_tags'
require_relative 'crm/crm_tasks'
require_relative 'crm/crm_user_fields'
module Teamlab
  class Crm
    include CrmCases
    include CrmCommon
    include CrmContacts
    include CrmFiles
    include CrmHistory
    include CrmInvoices
    include CrmOpportunities
    include CrmTags
    include CrmTasks
    include CrmUserFields

    def initialize
      @request = Teamlab::Request.new('crm')
    end

    # region General
    def add_deal_to_contact(contact_id, opportunity_id)
      @request.post(['contact', contact_id.to_s, 'opportunity', opportunity_id.to_s])
    end

    def save_smtp_settings(options = {})
      @request.put(%w[settings smtp], options)
    end

    #=========================================== TODO: OPTIONAL VARIABLES =====================================================

    def update_organisation_company_name(title)
      @request.put(%w[settings organisation base], companyName: title)
    end

    def update_organisation_address(text)
      @request.put(%w[settings organisation address], companyAddress: text)
    end

    # region Files

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
