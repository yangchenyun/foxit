module Foxit
  class Client
  # Defines methods related to projects.
    module Projects

      # projects
      def projects(options = {})
        get "/projects", options
      end

      def project(id_or_name)
        get "/projects/#{id_or_name}"
      end

      def create_project(options = {})
        post "/projects", options
      end

      # members
      def team_members(project, options={})
        get "/projects/#{project}/members", options
      end

      def team_member(project, user_id)
        get("/projects/#{project}/members/#{user_id}")
      end

      def add_team_member(project, options = {})
        post("/projects/#{project}/members", options)
      end

      def edit_team_member(project, user_id, options = {})
        put("/projects/#{project}/members/#{user_id}", options)
      end

      def remove_team_member(project, user_id)
        delete("/projects/#{project}/members/#{user_id}")
      end

      # hooks
      def project_hooks(project, options = {})
        get("/projects/#{project}/hooks", options)
      end

      def project_hook(project, hook_id)
        get("/projects/#{project}/hooks/#{hook_id}")
      end

      def add_project_hook(project, options = {})
        post("/projects/#{project}/hooks", options)
      end

      def edit_project_hook(project, hook_id, options = {})
        put("/projects/#{project}/hooks/#{hook_id}", options)
      end

      def delete_project_hook(project, hook_id)
        delete("/projects/#{project}/hooks/#{hook_id}")
      end
    end
  end
end
