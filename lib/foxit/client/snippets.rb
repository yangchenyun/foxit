module Foxit
  class Client
  # Defines methods related to snippets.
    module Snippets

      def snippets(project, options = {})
        get "/projects/#{project}/snippets", options
      end

      def snippet(project, snippet_id)
        get "/projects/#{project}/snippets/#{snippet_id}"
      end

      def create_snippet(project, options = {})
        post "/projects/#{project}/snippets", options
      end

      def edit_snippet(project, snippet_id, options = {})
        put "/projects/#{project}/snippets/#{snippet_id}", options
      end

      def delete_snippet(project, snippet_id)
        delete "/projects/#{project}/snippets/#{snippet_id}"
      end
    end
  end
end
