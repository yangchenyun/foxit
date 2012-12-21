module Foxit
  class Client
    # Defines methods related to milestones.
    module Milestones
      def milestones(project, options = {})
        get("/projects/#{project}/milestones")
      end

      def milestone(project, id)
        get("/projects/#{project}/milestones/#{id}")
      end

      def create_milestone(project, options = {})
        post("/projects/#{project}/milestones", options)
      end

      def edit_milestone(project, id, options={})
        put("/projects/#{project}/milestones/#{id}", options)
      end

      def close_milestone(project, id)
        edit_milestone(project, id, { closed: 1 })
      end

      def reopen_milestone(project, id)
        edit_milestone(project, id, { closed: 0 })
      end
    end
  end
end
