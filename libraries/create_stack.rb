class CreateStack

  def build_command(args)
    name              = args[:object_name]
    environment       = args[:environment] ||= 'default'
    template          = args[:template] ||= name
    inputs            = args[:inputs]
    read_outputs_from = args[:read_outputs_from]

    cmd = "simple_deploy create -e #{environment} \
                                -n #{name} \
                                -t #{template}"

    read_outputs_from.each do |stack|
      cmd << " -i #{stack}"
    end

    inputs.each_pair do |key, value|
      cmd << " -a #{key}=#{value}"
    end

    cmd
  end

end