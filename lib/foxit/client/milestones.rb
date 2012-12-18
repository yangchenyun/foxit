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
    end
  end
end
