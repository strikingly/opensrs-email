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

      DOMAIN_REQUIRED_ARGS = {
        :create_domain => [:domain],
        :create_domain_alias => [:domain, :alias],
        :delete_domain => [:domain],
        :delete_domain_alias => [:alias],
        :create_domain_welcome_email => [:domain, :welcome_text, :welcome_subject, :from_name, :from_address, :charset, :mime_type],
        :get_company_domains => [],
        :delete_domain_welcome_email => [:domain],
        :get_domain => [:domain],
        :get_domain_brand => [:domain],
        :change_domain => [:domain],
        :set_domain_admin => [:domain, :mailbox],
        :set_domain_brand => [:domain],
        :set_domain_catch_all_mailbox => [:domain, :state, :mailbox],
        :set_domain_disabled_status => [:domain, :disabled],
        :get_num_domain_mailboxes => [:domain],
        :get_domain_mailboxes => [:domain],
        :get_domain_mailbox_limits => [:domain],
        :set_domain_mailbox_limits => [:domain],
        :set_domain_allow_list => [:domain, :list],
        :set_domain_block_list => [:domain, :list],
        :get_domain_allow_list => [:domain],
        :get_domain_block_lis => [:domain]
      }
      
      DOMAIN_COMMANDS.each do |method_name|
        define_method("#{method_name}") { |*args|
          has_opt = args[-1].is_a? Hash
          if has_opt
            positional_args = args[0...-1]
            optional_args = args[-1]
          else
            positional_args = args
            optional_args = {}
          end
          required_args = DOMAIN_REQUIRED_ARGS[method_name]
          if required_args.length != positional_args.length
            raise "Argument Error for method #{method_name}: required arguments are: #{required_args}, provided arguments are: #{positional_args}"
          else
            params = Hash[required_args.zip(positional_args)]
            params = params.merge(optional_args)
            call(method_name, params)
          end
        }
      end
    end
  end
end

