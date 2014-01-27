module Opensrs
  module Email
    module Mailbox
      MAIL_COMMANDS = [
                       :get_mailbox_availability,
                       :get_alternate_mailbox_names,
                       :create_mailbox,
                       :set_mail_admin,
                       :change_mailbox,
                       :create_alias_mailbox,
                       :rename_mailbox,
                       :set_mailbox_allow_list,
                       :set_mailbox_block_list,
                       :get_mailbox_allow_list,
                       :get_mailbox_block_list,
                       :verify_password,
                       :get_admin,
                       :get_mailbox,
                       :get_mailbox_any,
                       :get_mailbox_services,
                       :set_mailbox_services,
                       :get_mailbox_quota,
                       :set_mailbox_quota,
                       :delete_mailbox,
                       :delete_mailbox_any,
                       :set_mailbox_autorespond,
                       :get_mailbox_autorespond,
                       :set_mailbox_forward,
                       :get_mailbox_forward,
                       :show_available_offerings,
                       :show_enabled_offerings,
                       :disable_offering,
                       :enable_offering,
                       :set_mailbox_suspension,
                       :get_mailbox_suspension,
                       :set_mailbox_status,
                       :get_mailbox_status,
                       :create_group_alias_mailbox,
                       :get_group_alias_mailbox,
                       :get_group_alias_mailbox,
                       :change_group_alias_mailbox,
                       :delete_group_alias_mailbox,
                       :create_mailbox_forward_only,
                       :get_mailbox_forward_only,
                       :change_mailbox_forward_only,
                       :delete_mailbox_forward_only,
                      ]

      MAIL_REQUIRED_ARGS = {
        :get_mailbox_availability => [:domain, :mailbox_list],
        :get_alternate_mailbox_names => [:mailbox_list],
        :create_mailbox => [:mailbox, :password, :workgroup, :domain],
        :set_mail_admin => [:domain, :mailbox],
        :change_mailbox => [:mailbox, :domain],
        :create_alias_mailbox => [:mailbox, :domain, :alias_mailbox],
        :rename_mailbox => [:domain, :old_mailbox, :new_mailbox],
        :set_mailbox_allow_list => [:mailbox, :domain, :list],
        :set_mailbox_block_list => [:mailbox, :domain, :list],
        :get_mailbox_allow_list => [:mailbox, :domain],
        :get_mailbox_block_list => [:mailbox, :domain],
        :verify_password => [:domain, :mailbox, :password],
        :get_admin => [:domain, :mailbox],
        :get_mailbox => [:domain, :mailbox],
        :get_mailbox_any => [:domain, :mailbox],
        :get_mailbox_services => [:mailbox, :domain],
        :set_mailbox_services => [:mailbox, :domain],
        :get_mailbox_quota => [:mailbox, :domain],
        :set_mailbox_quota => [:mailbox, :domain, :quota],
        :delete_mailbox => [:mailbox, :domain],
        :delete_mailbox_any => [:domain, :mailbox],
        :set_mailbox_autorespond => [:mailbox, :domain],
        :get_mailbox_autorespond => [:mailbox, :domain],
        :set_mailbox_forward => [:mailbox, :domain],
        :get_mailbox_forward => [:mailbox, :domain],
        :show_available_offerings => [:domain, :mailbox],
        :show_enabled_offerings => [:domain, :mailbox],
        :disable_offering => [:mailbox_offering_id],
        :enable_offering => [:domain, :mailbox, :offering_id],
        :set_mailbox_suspension => [:mailbox, :domain],
        :get_mailbox_suspension => [:mailbox, :domain],
        :set_mailbox_status => [:mailbox, :domain],
        :get_mailbox_status => [:mailbox, :domain],
        :create_group_alias_mailbox => [:group_alias_mailbox, :workgroup, :domain, :alias_to_email_cdl],
        :get_group_alias_mailbox => [:domain, :group_alias_mailbox],
        :change_group_alias_mailbox => [:domain, :group_alias_mailbox],
        :delete_group_alias_mailbox => [:group_alias_mailbox, :domain],
        :create_mailbox_forward_only => [:mailbox, :workgroup, :domain, :forward_email],
        :get_mailbox_forward_only => [:domain, :mailbox],
        :change_mailbox_forward_only => [:domain, :mailbox],
        :delete_mailbox_forward_only => [:mailbox, :domain]
      }

      MAIL_COMMANDS.each do |method_name|
        define_method("#{method_name}") { |*args|
          has_opt = args[-1].is_a? Hash
          if has_opt
            positional_args = args[0...-1]
            optional_args = args[-1]
          else
            positional_args = args
            optional_args = {}
          end
          required_args = MAIL_REQUIRED_ARGS[method_name]
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
