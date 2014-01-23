module Opensrs
  module Email
    module Domain
      def create_domain(domain)
        call(:create_domain, {:domain => domain})
      end
    end
  end
end

