module Foxit
  class Client
    # Defines methods related to notes.
    module Notes

      def wall_notes(project)
        get("/projects/#{project}/notes")
      end

      def wall_note(project, note_id)
        get("/projects/#{project}/notes/#{note_id}")
      end

      def create_wall_note(project, body)
        post("/projects/#{project}/notes", {:body => body})
      end

      def issue_notes(project, issue_id)
        get("/projects/#{project}/issues/#{issue_id}/notes")
      end

      def issue_note(project, issue, note_note_id)
        get("/projects/#{project}/issues/#{issue}/notes/#{note_id}")
      end

      def create_issue_note(project, issue, body)
        post("/projects/#{project}/issues/#{issue}/notes", {:body => body})
      end

      def snippet_notes(project, snippet_id)
        get("/projects/#{project}/snippets/#{snippet_id}/notes")
      end

      def snippet_note(project, snippet, note_note_id)
        get("/projects/#{project}/snippets/#{snippet}/notes/#{note_id}")
      end

      def create_snippet_note(project, snippet, body)
        post("/projects/#{project}/snippets/#{snippet}/notes", {:body => body})
      end
    end
  end
end
