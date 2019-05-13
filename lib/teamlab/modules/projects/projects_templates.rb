module Teamlab
  # Module for projects templates methods
  module ProjectsTemplates
    def get_templates
      @request.get(['template'])
    end

    def get_template(template_id)
      @request.get(['template', template_id.to_s])
    end

    def create_template(title, options = {})
      @request.post(['template'], { title: title }.merge(options))
    end

    def update_template(id, title)
      @request.put(['template', id.to_s], title: title)
    end

    def delete_template(id)
      @request.delete(['template', id.to_s])
    end
  end
end
