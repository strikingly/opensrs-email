module Opensrs
  module Email
    module Workgroup
      WORKGROUP_COMMANDS = [
                           :create_workgroup,
                           :get_domain_workgroups,
                           :delete_workgroup,
                           :set_workgroup_admin
                          ]
      
      WORKGROUP_REQUIRED_ARGS = {
        :create_workgroup => [:workgroup, :domain],
        :get_domain_workgroups => [:domain],
        :delete_workgroup => [:workgroup, :domain],
        :set_workgroup_admi => [:domain, :mailbox]
      }

      WORKGROUP_COMMANDS.each do |method_name|
        define_method("#{method_name}") { |*args|
          positional_args = args[0...-1]
          optional_args = args[-1] || {}
          required_args = WORKGROUP_REQUIRED_ARGS[method_name]
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
