# frozen_string_literal: true

require_relative 'portal_cleanup/crm_cleanup'
require_relative 'portal_cleanup/mailserver_cleanup'

module PortalCleanup
  include CrmCleanup
  include MailServerCleanup

  # @return [Void] reset all portal data
  def reset_portal
    reset_modules
    remove_users
    remove_blog_posts
    remove_bookmarks
    remove_events
    remove_forum_categories
    remove_calendars
    remove_groups
    crm_cleanup
    remove_mailserver_mailboxes
  end

  # @return [Void] Set all modules to true
  def reset_modules
    SETTINGS_ENTITY_IDS.each do |module_id|
      Teamlab.settings.set_access(module_id, true)
    end
  end

  # @return [Void] Remove all user expect admin from portal
  def remove_users
    users = Teamlab.people.get_people.data
    users.each do |user|
      next if user['isOwner']

      Teamlab.people.change_people_status('2', [user['id']])
      Teamlab.people.delete_user(user['id'])
    end
  end

  # @return [Void] Remove all blog posts on portal
  def remove_blog_posts
    bookmarks = Teamlab.community.get_all_posts.data
    bookmarks.each do |bookmark|
      Teamlab.community.delete_post(bookmark['id'])
    end
  end

  # @return [Void] Remove all bookmarks on portal
  def remove_bookmarks
    bookmarks = Teamlab.community.get_all_bookmarks.data
    bookmarks.each do |bookmark|
      Teamlab.community.delete_bookmark(bookmark['id'])
    end
  end

  # @return [Void] Remove all events on portal
  def remove_events
    events = Teamlab.community.get_all_events.data
    events.each do |event|
      Teamlab.community.delete_event(event['id'])
    end
  end

  # @return [Void] Remove all forum categories
  def remove_forum_categories
    categories = Teamlab.community.get_forums.data['categories']
    categories.each do |category|
      Teamlab.community.delete_category(category['id'])
    end
  end

  # @return [Void] Remove all calendars
  def remove_calendars
    all_calendars = Teamlab.calendar.get_calendars_and_subscriptions(DateTime.new(1990).strftime('%Y-%m-%dT%H-%M-%S.%LZ').to_s,
                                                                     DateTime.now.strftime('%Y-%m-%dT%H-%M-%S.%LZ').to_s).data
    all_calendars.each do |current_calendar|
      Teamlab.calendar.delete_calendar(current_calendar['objectId']) if current_calendar['isEditable'] || current_calendar['isiCalStream']
    end
  end

  # @return [Void] Remove all groups
  def remove_groups
    Teamlab.group.get_groups.data.each do |group|
      Teamlab.group.delete_group(group['id'])
    end
  end
end
