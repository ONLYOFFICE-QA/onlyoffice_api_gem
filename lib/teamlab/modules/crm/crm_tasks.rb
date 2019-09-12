# frozen_string_literal: true

module Teamlab
  # Methods for working with crm tasks
  module CrmTasks
    def create_task(title, deadline, responsible_id, category_id, options = {})
      @request.post(%w[task], { title: title, deadline: deadline, responsibleId: responsible_id, categoryId: category_id }.merge(options))
    end

    def update_task(task_id, title, deadline, category_id, options = {})
      @request.put(['task', task_id.to_s], { title: title, deadline: deadline, categoryid: category_id }.merge(options))
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
  end
end
