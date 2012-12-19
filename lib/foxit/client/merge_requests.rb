module Foxit
  class Client
    # Defines methods related to merge requests.
    module MergeRequests

      def merge_requests(project, options={})
        get("/projects/#{project}/merge_requests", options)
      end

      # Gets a single merge request.
      #
      # @example
      #   Gitlab.merge_request(5, 36)
      #   Gitlab.merge_request('gitlab', 42)
      #
      # @param  [Integer, String] project The ID or code name of a project.
      # @param  [Integer] id The ID of a merge request.
      # @return [Array<Gitlab::ObjectifiedHash>]
      def merge_request(project, id)
        get("/projects/#{project}/merge_request/#{id}")
      end
    end
  end
end
