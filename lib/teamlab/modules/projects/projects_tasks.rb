# frozen_string_literal: true

module Teamlab
  # Module for projects tasks methods
  module ProjectsTasks
    def get_my_tasks
      @request.get(%w[task @self])
    end

    def get_task_by_filter(options = {})
      @request.get(%w[task filter], options)
    end

    def get_task(id)
      @request.get(['task', id.to_s])
    end

    def get_tasks(project_id)
      @request.get([project_id.to_s, 'task'])
    end

    def get_my_tasks_by_status(status)
      @request.get(['task', '@self', status.to_s])
    end

    def notify_task_responsible(task_id)
      @request.get(['task', task_id.to_s, 'notify'])
    end

    def get_all_tasks(project_id)
      @request.get([project_id.to_s, 'task'])
    end

    def check_subscription_to_task_action(task_id)
      @request.get(['task', task_id.to_s, 'subscribe'])
    end

    def get_tasks_with_status(project_id, status)
      @request.get([project_id.to_s, 'task', status.to_s])
    end

    def get_my_tasks_with_status(project_id, status)
      @request.get([project_id.to_s, 'task', '@self', status.to_s])
    end

    def create_subtask(task_id, responsible_id, title)
      @request.post(['task', task_id.to_s], responsible: responsible_id, title: title)
    end

    def add_link(parent_task_id, dependence_task_id, link_type)
      @request.post(['task', parent_task_id.to_s, 'link'], dependenceTaskId: dependence_task_id, linkType: link_type)
    end

    def add_task(project_id, title, options = {})
      @request.post([project_id.to_s, 'task'], { title: title }.merge(options))
    end

    def add_task_from_discussion(project_id, message_id)
      @request.post([project_id.to_s, 'task', message_id.to_s])
    end

    def update_task_status(task_id, status)
      @request.put(['task', task_id.to_s, 'status'], status: status)
    end

    def update_project_task(task_id, title, options = {})
      @request.put(['task', task_id.to_s], { title: title.to_s }.merge(options))
    end

    def update_task_milestone(task_id, milestone_id)
      @request.put(['task', task_id.to_s, 'milestone'], milestoneId: milestone_id)
    end

    def subscribe_to_task_action(task_id)
      @request.put(['task', task_id.to_s, 'subscribe'])
    end

    def update_subtask(task_id, subtask_id, responsible_id, title)
      @request.put(['task', task_id.to_s, subtask_id.to_s], responsible: responsible_id, title: title)
    end

    def update_subtask_status(task_id, subtask_id, status)
      @request.put(['task', task_id.to_s, subtask_id.to_s, 'status'], status: status)
    end

    def delete_subtask(task_id, subtask_id)
      @request.delete(['task', task_id.to_s, subtask_id.to_s])
    end

    def delete_task(id)
      @request.delete(['task', id.to_s])
    end
  end
end
