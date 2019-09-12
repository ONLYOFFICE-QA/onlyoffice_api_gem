# frozen_string_literal: true

module Teamlab
  # Methods for working with crm tasks
  module CrmUserFields
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
  end
end
