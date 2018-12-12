module PortalCleanup
  # @return [Void] reset all portal data
  def reset_portal
    reset_modules
  end

  # @return [Void] Set all modules to true
  def reset_modules
    SETTINGS_ENTITY_IDS.each do |module_id|
      Teamlab.settings.set_access(module_id, true)
    end
  end
end
