module Foxit
  class Client
    # Defines methods related to users.
    module Users
      # Gets a list of users.
      #
      # @example
      #   Gitlab.users
      #
      # @param  [Hash] options A customizable set of options.
      # @option options [Integer] :page The page number.
      # @option options [Integer] :per_page The number of results per page.
      # @return [Array<Gitlab::ObjectifiedHash>]
      def users(options = {})
        get "users", options
      end

      # Gets information about a user.
      # Will return information about an authorized user if no ID passed.
      #
      # @example
      #   Gitlab.user
      #   Gitlab.user(2)
      #
      # @param  [Integer] id The ID of a user.
      # @return [Gitlab::ObjectifiedHash]
      def user(user = nil)
        if user
          get "users/#{user}"
        else
          get 'user'
        end
      end

      # Creates a new user.
      # Requires authentication from an admin account.
      #
      # @param  [Hash] options A customizable set of options.
      # @return [Gitlab::ObjectifiedHash] Information about created user.
      def create_user(options = {})
        post "/users", options
      end

      # Gets a list of user's SSH keys.
      #
      # @example
      #   Gitlab.ssh_keys
      #
      # @param  [Hash] options A customizable set of options.
      # @option options [Integer] :page The page number.
      # @option options [Integer] :per_page The number of results per page.
      # @return [Array<Gitlab::ObjectifiedHash>]
      def ssh_keys(options = {})
        get("user/keys", options)
      end

      # Gets information about SSH key.
      #
      # @example
      #   Gitlab.ssh_key(1)
      #
      # @param  [Integer] user The ID of a user's SSH key.
      # @return [Gitlab::ObjectifiedHash]
      def ssh_key(user)
        get("user/keys/#{user}")
      end

      # Creates a new SSH key.
      #
      # @example
      #   Gitlab.create_ssh_key('key title', 'key body')
      #
      # @param  [String] title The title of an SSH key.
      # @param  [String] key The SSH key body.
      # @return [Gitlab::ObjectifiedHash] Information about created SSH key.
      def create_ssh_key(options = {})
        post("user/keys", options)
      end

      # Deletes an SSH key.
      #
      # @example
      #   Gitlab.delete_ssh_key(1)
      #
      # @param  [Integer] user The IDJ of a user's SSH key.
      # @return [Gitlab::ObjectifiedHash] Information about deleted SSH key.
      def delete_ssh_key(user)
        delete("user/keys/#{user}")
      end
    end
  end
end
