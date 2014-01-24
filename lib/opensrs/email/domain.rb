module Opensrs
  module Email
    module Domain
      DOMAIN_COMMANDS = [
                         :create_domain,
                         :create_domain_alias,
                         :delete_domain,
                         :delete_domain_alias,
                         :create_domain_welcome_email,
                         :get_company_domains,
                         :delete_domain_welcome_email,
                         :get_domain,
                         :get_domain_brand,
                         :change_domain,
                         :set_domain_admin,
                         :set_domain_brand,
                         :set_domain_catch_all_mailbox,
                         :set_domain_disabled_status,
                         :get_num_domain_mailboxes,
                         :get_domain_mailboxes,
                         :get_domain_mailbox_limits,
                         :set_domain_mailbox_limits,
                         :set_domain_allow_list,
                         :set_domain_block_list,
                         :get_domain_allow_list,
                         :get_domain_block_list
                        ]
      def create_domain(domain)
        call(:create_domain, {:domain => domain})
      end
    end
  end
end

