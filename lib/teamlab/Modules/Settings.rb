module Teamlab

  class Settings

    def initialize
      @request = Teamlab::Request
    end

    def get_settings
      @request.get
    end

    def get_logo
      @request.get(['logo'])
    end

    def get_usage_quota
      @request.get(['quota'])
    end

    def get_version
      @request.get(['version'])
    end

    def get_security(ids = [])
      @request.get(['security'], ids: ids)
    end

    def get_admin_security(product_id, user_id)
      @request.get(['security', 'administrator'], productid: product_id, userid: user_id)
    end

    def get_product_admin(product_id)
      @request.get(['security', 'administrator', product_id.to_s])
    end

    def set_version(version_id)
      @request.put(['version'], versionId: version_id)
    end

    def set_security(id, options = {})
      @request.put(['security'], { id: id }.merge(options))
    end

    def set_access(id, enabled = true)
      @request.put(['access'], items: [id, enabled])
    end

    def set_product_admin(product_id, user_id, administrator = true)
      @request.put(['security', 'administrator'], productid: product_id, userid: user_id, administrator: administrator)
    end
  end
end