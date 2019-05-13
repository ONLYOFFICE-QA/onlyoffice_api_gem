module Teamlab
  # Module for projects time methods
  module ProjectsTime
    def get_time_spent_by_filter(options = {})
      @request.get(%w[time filter], options)
    end

    def get_total_time_spent_by_filter(options = {})
      @request.get(%w[time filter total], options)
    end

    def get_time_spent(task_id)
      @request.get(['task', task_id.to_s, 'time'])
    end

    def add_task_time(task_id, date, person_id, project_id, options = {})
      @request.post(['task', task_id.to_s, 'time'], { date: date, personId: person_id, projectId: project_id }.merge(options))
    end

    def update_task_time(time_id, date, person_id, options = {})
      @request.put(['time', time_id.to_s], { date: date, personId: person_id }.merge(options))
    end

    def update_time_status_of_payment(time_ids, status)
      @request.put(%w[time times status], timeids: time_ids, status: status)
    end

    def delete_time_spents(*time_ids)
      @request.delete(%w[time times remove], timeIds: time_ids.flatten)
    end
  end
end
