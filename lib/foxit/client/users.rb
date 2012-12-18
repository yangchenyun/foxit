module Foxit
  class Client
    module Users
      def all_users(options={})
        get "users", options
      end
    end
  end
end
