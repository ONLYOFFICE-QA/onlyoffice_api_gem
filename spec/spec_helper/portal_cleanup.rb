# frozen_string_literal: true

require_relative 'portal_cleanup/crm_cleanup'
require_relative 'portal_cleanup/mailserver_cleanup'

module PortalCleanup
  include CrmCleanup
  include MailServerCleanup

  # @return [Void] reset all portal data
  def reset_portal(api)
    reset_modules(api)
    remove_users(api)
    remove_blog_posts(api)
    remove_bookmarks(api)
    remove_events(api)
    remove_forum_categories(api)
    remove_calendars(api)
    remove_groups(api)
    crm_cleanup(api)
    remove_projects(api)
    remove_mailserver_mailboxes(api)
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Set all modules to true
  def reset_modules(api)
    SETTINGS_ENTITY_IDS.each do |module_id|
      api.settings.set_access(module_id, true)
    end
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Remove all user expect admin from portal
  def remove_users(api)
    active_users = api.people.get_people.data
    terminated_users = api.people.get_people_by_status(:terminated).data
    (active_users + terminated_users).each do |user|
      next if user['isOwner']

      api.people.change_people_status('2', [user['id']])
      api.people.delete_user(user['id'])
    end
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Remove all blog posts on portal
  def remove_blog_posts(api)
    bookmarks = api.community.get_all_posts.data
    bookmarks.each do |bookmark|
      api.community.delete_post(bookmark['id'])
    end
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Remove all bookmarks on portal
  def remove_bookmarks(api)
    bookmarks = api.community.get_all_bookmarks.data
    bookmarks.each do |bookmark|
      api.community.delete_bookmark(bookmark['id'])
    end
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Remove all events on portal
  def remove_events(api)
    events = api.community.get_all_events.data
    events.each do |event|
      api.community.delete_event(event['id'])
    end
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Remove all forum categories
  def remove_forum_categories(api)
    categories = api.community.get_forums.data['categories']
    categories.each do |category|
      api.community.delete_category(category['id'])
    end
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Remove all calendars
  def remove_calendars(api)
    all_calendars = api.calendar.get_calendars_and_subscriptions(DateTime.new(1990).strftime('%Y-%m-%dT%H-%M-%S.%LZ').to_s,
                                                                 DateTime.now.strftime('%Y-%m-%dT%H-%M-%S.%LZ').to_s).data
    all_calendars.each do |current_calendar|
      api.calendar.delete_calendar(current_calendar['objectId']) if current_calendar['isEditable'] || current_calendar['isiCalStream']
    end
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Remove all groups
  def remove_groups(api)
    api.group.get_groups.data.each do |group|
      api.group.delete_group(group['id'])
    end
  end

  # @param [Teamlab::OnlyofficeApiInstance] api to use
  # @return [Void] Remove all projects
  def remove_projects(api)
    api.project.get_projects.data.each do |group|
      api.project.delete_project(group['id'])
    end
  end
end
