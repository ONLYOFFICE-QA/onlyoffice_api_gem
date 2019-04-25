module Teamlab
  # Methods for working with crm cases
  module CrmTags
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

    def add_tag_to_case_group_by_filter(tag_name, options = {})
      @request.post(%w[case filter taglist], { tagName: tag_name }.merge(options))
    end

    def add_tag_group_to_entity(entity_type, entity_id, tag_name)
      @request.post([entity_type.to_s, 'taglist'], entityId: entity_id, tagName: tag_name)
    end

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

    def add_contact_tag_to_group(entity_type, entity_id, tag)
      @request.post([entity_type.to_s, entity_id.to_s, 'tag', 'group'], tagName: tag)
    end
  end
end
