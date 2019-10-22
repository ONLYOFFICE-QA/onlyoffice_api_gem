# frozen_string_literal: true

module PortalCleanup
  # @return [Void] reset all portal data
  def reset_portal
    reset_modules
    remove_users
    remove_blog_posts
    remove_bookmarks
    remove_events
  end

  # @return [Void] Set all modules to true
  def reset_modules
    SETTINGS_ENTITY_IDS.each do |module_id|
      Teamlab.settings.set_access(module_id, true)
    end
  end

  # @return [Void] Remove all user expect admin from portal
  def remove_users
    users = Teamlab.people.get_people.body['response']
    users.each do |user|
      next if user['isOwner']

      Teamlab.people.change_people_status('2', [user['id']])
      Teamlab.people.delete_user(user['id'])
    end
  end

  # @return [Void] Remove all blog posts on portal
  def remove_blog_posts
    bookmarks = Teamlab.community.get_all_posts.body['response']
    bookmarks.each do |bookmark|
      Teamlab.community.delete_post(bookmark['id'])
    end
  end

  # @return [Void] Remove all bookmarks on portal
  def remove_bookmarks
    bookmarks = Teamlab.community.get_all_bookmarks.body['response']
    bookmarks.each do |bookmark|
      Teamlab.community.delete_bookmark(bookmark['id'])
    end
  end

  # @return [Void] Remove all events on portal
  def remove_events
    events = Teamlab.community.get_all_events.body['response']
    events.each do |event|
      Teamlab.community.delete_event(event['id'])
    end
  end
end
