module Foxit
  class Client
    # Defines methods related to issues.
    module Issues

      def issues(project = nil, options = {})
        if project.nil?
          get("/issues", options)
        else
          get("/projects/#{project}/issues", options)
        end
      end

      def issue(project, id)
        get("/projects/#{project}/issues/#{id}")
      end

      def create_issue(project, options = {})
        post("/projects/#{project}/issues", options)
      end

      def edit_issue(project, id, options = {})
        put("/projects/#{project}/issues/#{id}", options)
      end

      def close_issue(project, id)
        edit_issue(project, id, { closed: 1 })
      end

      def reopen_issue(project, id)
        edit_issue(project, id, { closed: 0 })
      end

      def delete_issue(project, id)
        delete("/projects/#{project}/issues/#{id}")
      end
    end
  end
end
