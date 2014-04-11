module Teamlab

  class Group

    def initialize
      @request = Teamlab::Request.new('group')
    end

    def get_groups
      @request.get
    end

    def get_group(group_id)
      @request.get([ group_id.to_s ])
    end

    def add_group(manager, name, members = [])
      @request.post([''], { groupManager: manager, groupName: name, members: members})
    end

    def replace_members(group_id, members)
      @request.post([group_id.to_s, 'members'], { members: members})
    end

    def update_group(group_id, options = {})
      @request.put([group_id.to_s], options)
    end

    def add_group_users(group_id, members = [])
      @request.put([group_id.to_s, 'members'], {members: members})
    end

    def set_group_manager(group_id, user_id)
      @request.put([group_id.to_s, 'manager'], {userid: user_id})
    end

    def move_group_members(group_id, new_group_id)
      @request.put([group_id.to_s, 'members', new_group_id.to_s])
    end

    def delete_group(group_id)
      @request.delete([group_id.to_s])
    end

    def remove_group_members(group_id, members = [])
      @request.delete([group_id.to_s, 'members'], members: members)
    end
  end
end