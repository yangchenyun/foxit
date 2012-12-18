module Foxit
  class Client
    # Defines methods related to users.
    module Users

      def users(options = {})
        get "users", options
      end

      def user(user = nil)
        if user
          get "users/#{user}"
        else
          get 'user'
        end
      end

      def create_user(options = {})
        post "/users", options
      end

      def ssh_keys(options = {})
        get("user/keys", options)
      end

      def ssh_key(key_id)
        get("user/keys/#{key_id}")
      end

      def create_ssh_key(options = {})
        post("user/keys", options)
      end

      def delete_ssh_key(key_id)
        delete("user/keys/#{key_id}")
      end
    end
  end
end
