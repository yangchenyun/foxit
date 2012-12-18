module Foxit
  class Client
    # Defines methods related to repositories.
    module Repositories

      def branches(project, options = {})
        get("/projects/#{project}/repository/branches", options)
      end

      def branch(project, branch)
        get("/projects/#{project}/repository/branches/#{branch}")
      end

      def tags(project, options = {})
        get("/projects/#{project}/repository/tags", options)
      end

      def commits(project, options = {})
        get("/projects/#{project}/repository/commits", options)
      end

      # FIXME not working now
      def raw(project, sha_or_branch, options = {})
        get("/projects/#{project}/repository/commits/#{sha_or_branch}/blob", options)
      end
    end
  end
end
