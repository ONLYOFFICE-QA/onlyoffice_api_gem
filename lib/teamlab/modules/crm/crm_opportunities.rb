# frozen_string_literal: true

module Teamlab
  # Methods for working with crm opportunities methods
  module CrmOpportunities
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

    # Returns a list of all the opportunities for the contact with the ID specified in the request
    # @param contact_id [String, Integer] Contact ID
    # @return [Array] List of opportunities
    def get_contact_opportunities(contact_id)
      @request.get(['opportunity', 'bycontact', contact_id.to_s])
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
  end
end
