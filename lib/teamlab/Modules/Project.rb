module Teamlab
  class Project
    def initialize
      @request = Teamlab::Request.new('project')
    end

    #region Import

    def get_import_status
      @request.get(['import'])
    end

    def add_importing_url_to_queue(company_url, username, password, import_closed, disable_notifications, import_users_as_collaborators, projects = [])
      @request.post(%w(import), url: company_url, userName: username, password: password, importClosed: import_closed,
      disableNotifications: disable_notifications, importUsersAsCollaborators: import_users_as_collaborators, projects: projects)
    end

    def get_projects_for_import(url, username, password)
      @request.post(%w(import projects), url: url, userName: username, password: password)
    end

    #endregion

    #region Discussions

    def get_latest_discussion_messages #есть тест
      @request.get(['message'])
    end

    def get_message_by_filter(options = {}) #есть тест
      @request.get(%w(message filter), options)
    end

    def get_messages(project_id) #есть тест
      @request.get([project_id.to_s, 'message'])
    end

    def get_project_message(message_id)
      @request.get(['message', message_id.to_s])
    end

    def check_subscription_to_discussion(message_id) #есть тест
      @request.get(['message', message_id.to_s, 'subscribe'])
    end

    def add_message(project_id, title, content, participants, options = {}) #есть тест
      @request.post([project_id.to_s, 'message'], { title: title, content: content, participants: participants }.merge(options))
    end

    def update_message(message_id, project_id, title, content, options = {}) #есть тест
      @request.put(['message', message_id.to_s], { projectid: project_id, title: title, content: content }.merge(options))
    end

    def subscribe_to_message_action(message_id) #есть тест
      @request.put(['message', message_id.to_s, 'subscribe'])
    end

    def delete_message(message_id) #есть тест
      @request.delete(['message', message_id.to_s])
    end

    #endregion

    #region Files

    def get_task_files(task_id) #есть тест
      @request.get(['task', task_id.to_s, 'files'])
    end

    def get_entity_files(entity_id, entity_type) #есть тест
      @request.get([entity_id.to_s, 'entityfiles'], entityType: entity_type)
    end

    def get_message_files(message_id) #есть тест
      @request.get(['message', message_id.to_s, 'files'])
    end

    def upload_file_to_task(task_id, *files) #есть тест
      @request.post(['task', task_id.to_s, 'files'], files: files.flatten)
    end

    def upload_file_to_message(message_id, *files) #есть тест
      @request.post(['message', message_id.to_s, 'files'], files: files.flatten)
    end

    def detach_file_from_task(task_id, file_id) #есть тест
      @request.delete(['task', task_id.to_s, 'files'], fileid: file_id)
    end

    def detach_file_from_message(message_id, file_id) #есть тест
      @request.delete(['message', message_id.to_s, 'files'], fileid: file_id)
    end

    #endregion

    #region Comment

    def get_comment(comment_id)
      @request.get(['comment', comment_id.to_s])
    end

    def get_task_comments(task_id)
      @request.get(['task', task_id.to_s, 'comment'])
    end

    def get_message_comments(message_id)
      @request.get(['message', message_id.to_s, 'comment'])
    end

    def add_task_comment(task_id, content, options = {}) #есть тест
      @request.post(['task', task_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def add_message_comment(message_id, content, options = {}) #есть тест
      @request.post(['message', message_id.to_s, 'comment'], { content: content }.merge(options))
    end

    def update_comment(comment_id, content) #есть тест
      @request.put(['comment', comment_id.to_s], content: content)
    end

    def delete_comment(comment_id) #есть тест
      @request.delete(['comment', comment_id.to_s])
    end

    #endregion

    #region Report Template

    def create_report_template(name, options = {})
      @request.post(['report'], { name: name }.merge(options))
    end

    def update_report_template(report_id, name, options = {})
      @request.put(['report', report_id.to_s], { name: name }.merge(options))
    end

    def delete_report_template(report_id)
      @request.delete(['report', report_id.to_s])
    end

    #endregion

    #region Projects

    def get_projects
      @request.get
    end

    def get_project(id)
      @request.get([id.to_s])
    end

    def get_participated_projects
      @request.get(['@self'])
    end

    def filter_projects(options = {})
      @request.get(['filter'], options)
    end

    def get_followed_projects
      @request.get(['@follow'])
    end

    def get_project_by_status(status)
      @request.get([status.to_s])
    end

    def get_templates
      @request.get(['template'])
    end

    def get_spent_time(project_id)
      @request.get([project_id.to_s, 'time'])
    end

    def get_project_files(project_id)
      @request.get([project_id.to_s, 'files'])
    end

    def get_template(template_id)
      @request.get([template_id.to_s])
    end

    def get_milestones(project_id)
      @request.get([project_id.to_s, 'milestone'])
    end

    def search_all_projects(query)
      @request.get(['@search', query.to_s])
    end

    def search_project(project_id, query)
      @request.get([project_id.to_s, '@search', query.to_s])
    end

    def get_milestones_with_status(project_id, status)
      @request.get([project_id.to_s, 'milestone', status.to_s])
    end

    def create_project(title, description, responsible_id, tags, private, options = {})
      @request.post('', { title: title, description: description, responsibleid: responsible_id, tags: tags, private: private}.merge(options))
    end

    def create_template(title, options = {})
      @request.post(['template'], { title: title }.merge(options))
    end

    def add_milestone(project_id, title, deadline, responsible_id, options = {})
      @request.post([project_id.to_s, 'milestone'], {title: title, deadline: deadline, responsible: responsible_id}.merge(options))
    end

    def update_project_tags(id, tags)
      @request.put([id.to_s, 'tag'], tags: tags)
    end

    def update_project_status(id, status)
      @request.put([id.to_s, 'status'], status: status)
    end

    def update_template(id, title)
      @request.put(['template', id.to_s], title: title)
    end

    def follow_unfollow_project(project_id)
      @request.put([project_id.to_s, 'follow'])
    end

    def delete_project(id)
      @request.delete([id.to_s])
    end

    def delete_template(id)
      @request.delete(['template', id.to_s])
    end

    def delete_task(id)
      @request.delete(['task', id.to_s])
    end

    #endregion

    def get_tasks_by_ids(*task_ids)
      @request.get(['task'], taskid: task_ids.flatten)
    end

    def get_task_order(project_id)
      @request.get([project_id.to_s, 'order'])
    end

    def get_simple_task_by_filter(project_id, options = {})
      @request.get(%w(task filter simple), { projectid: project_id }.merge(options))
    end

    def add_link(parent_task_id, dependence_task_id, link_type)
      @request.post(['task', parent_task_id.to_s, 'link'], dependenceTaskId: dependence_task_id, linkType: link_type)
    end

    def update_project(id, title, responsible_id, options = {})
      @request.put([id.to_s], { title: title, responsibleId: responsible_id }.merge(options))
    end

    def set_task_order(project_id, order)
      @request.put([project_id.to_s, 'order'], order: order)
    end

    def update_project_task(task_id, title, options = {})
      @request.put(['task', task_id.to_s], {title: title.to_s}.merge(options))
    end

    #region Team

    def get_project_team(project_id)
      @request.get([project_id.to_s, 'team'])
    end

    def get_projects_teams(*project_ids)
      @request.post(%w(team), ids: project_ids.flatten)
    end

    def add_to_team(project_id, user_id)
      @request.post([project_id.to_s, 'team'], userid: user_id)
    end

    def update_project_team(project_id, participants_ids, options = {})
      @request.put([project_id.to_s, 'team'], { participants: participants_ids }.merge(options))
    end

    def set_team_security(project_id, user_id, security, options = {})
      @request.put([project_id.to_s, 'team', 'security'], { userId: user_id, security: security }.merge(options))
    end

    def remove_from_team(project_id, user_id)
      @request.delete([project_id.to_s, 'team'], userId: user_id)
    end

    #endregion

    #region Tasks

    def get_my_tasks
      @request.get(%w(task @self))
    end

    def get_task_by_filter(options = {})
      @request.get(%w(task filter), options)
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
      @request.post(['task', task_id.to_s], { responsible: responsible_id, title: title })
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

    def update_task_milestone(task_id, milestone_id)
      @request.put(['task', task_id.to_s, 'milestone'], milestoneId: milestone_id)
    end

    def subscribe_to_task_action(task_id)
      @request.put(['task', task_id.to_s, 'subscribe'])
    end

    def update_subtask(task_id, subtask_id, responsible_id, title)
      @request.post(['task', task_id.to_s, subtask_id.to_s], responsibleId: responsible_id, title: title)
    end

    def update_subtask_status(task_id, subtask_id, status)
      @request.put(['task', task_id.to_s, subtask_id.to_s, 'status'], status: status)
    end

    def delete_subtask(task_id, subtask_id)
      @request.delete(['task', task_id.to_s, subtask_id.to_s])
    end

    #endregion

    #region Contacts

    def get_projects_for_contact(contact_id)
      @request.get(['contact', contact_id.to_s])
    end

    def add_project_contact(project_id, contact_id)
      @request.post([project_id.to_s, 'contact'], contactId: contact_id)
    end

    def delete_project_contact(project_id, contact_id)
      @request.delete([project_id.to_s, 'contact'], contactId: contact_id)
    end

    #endregion

    #region Tags

    def get_project_tags
      @request.get(%w(tag))
    end

    def get_project_by_tag(tag)
      @request.get(['tag', tag.to_s])
    end

    def get_tags_by_name(tag_name)
      @request.get(%w(tag search), tagName: tag_name)
    end

    #endregion

    def get_upcoming_milestones
      @request.get(%w(milestone))
    end

    def get_overdue_milestones
      @request.get(%w(milestone late))
    end

    def get_milestone(id)
      @request.get(['milestone', id.to_s])
    end

    def get_milestones_by_filter(options = {})
      @request.get(%w(milestone filter), options)
    end

    def get_milestone_tasks(id)
      @request.get(['milestone', id.to_s, 'task'])
    end

    def get_milestones_by_month(year, month)
      @request.get(['milestone', year.to_s, month.to_s])
    end

    def get_milestones_by_full_date(year, month, day)
      @request.get(['milestone', year.to_s, month.to_s, day.to_s])
    end

    def update_milestone(id, title, deadline, options = {})
      @request.put(['milestone', id.to_s], { title: title, deadline: deadline }.merge(options))
    end

    def update_milestone_status(id, status)
      @request.put(['milestone', id.to_s, 'status'], status: status)
    end

    def delete_milestone(id)
      @request.delete(['milestone', id.to_s])
    end

    def get_time_spent_by_filter(options = {})
      @request.get(%w(time filter), options)
    end

    def get_total_time_spent_by_filter(options = {})
      @request.get(%w(time filter total), options)
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
      @request.put(%w(time times status), timeids: time_ids, status: status)
    end

    def delete_time_spents(*time_ids)
      @request.delete(%w(time times remove), timeIds: time_ids.flatten)
    end
  end
end