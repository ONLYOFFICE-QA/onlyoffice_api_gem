# frozen_string_literal: true

module Teamlab
  # Methods for working with crm history
  module CrmHistory
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
  end
end
