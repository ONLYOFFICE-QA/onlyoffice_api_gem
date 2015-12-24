module Teamlab

  class Settings

    def initialize
      @request = Teamlab::Request.new('settings')
    end

    def get_settings
      @request.get
    end

    def get_sso_settings
      @request.get(%w(SSO))
    end

    def get_ldap_settings
      @request.get(%w(LDAP))
    end

    def get_logo
      @request.get(%w(logo))
    end

    def get_usage_quota
      @request.get(%w(quota))
    end

    def get_version
      @request.get(%w(version))
    end

    def get_security(ids = [])
      @request.get(%w(security), ids: ids)
    end

    def get_ip_restrictions
      @request.get(%w(iprestrictions))
    end

    def get_white_label_sizes
      @request.get(%w(whitelabel sizes))
    end

    def get_admin_security(product_id, user_id)
      @request.get(%w(security administrator), productid: product_id, userid: user_id)
    end

    def get_product_admin(product_id)
      @request.get(['security', 'administrator', product_id.to_s])
    end

    def sms_settings(enable)
      @request.put(%w(sms), enable: enable)
    end

    def update_tips(show)
      @request.put(%w(tips), show: show)
    end

    def set_version(version_id)
      @request.put(%w(version), versionId: version_id)
    end

    def set_security(id, options = {})
      @request.put(%w(security), { id: id }.merge(options))
    end

    def save_ip_restrictions(ips)
      @request.put(%w(iprestrictions), ips: ips)
    end

    def set_access(id, enabled = true)
      @request.put(%w(security access), items: [{ key: id, value: enabled }])
    end

    def set_product_admin(product_id, user_id, administrator = true)
      @request.put(%w(security administrator), productid: product_id, userid: user_id, administrator: administrator)
    end

    def update_ip_restrictions(enable)
      @request.put(%w(iprestrictions settings), enable: enable)
    end
  end
end
