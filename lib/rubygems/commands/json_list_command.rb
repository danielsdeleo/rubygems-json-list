class Gem::Commands::JsonListCommand < Gem::Commands::QueryCommand
  
  class GemInfoHash < Hash
    def initialize
      super {|hsh,key| hsh[key] = []}
    end
  end

  def initialize(*args)
    super 'json_list', 'Display gems whose name starts with STRING and format the output as json'
    remove_option('--name-matches')
    @output = {:messages => []}
  end
  
  def arguments # :nodoc:
    "STRING        start of gem name to look for"
  end

  def defaults_str # :nodoc:
    "--local --no-details"
  end

  def usage # :nodoc:
    "#{program_name} [STRING]"
  end
  
  def execute
    string = get_one_optional_argument || ''
    options[:name] = /^#{string}/i
  
    super
    ui.outs.puts JSON.pretty_generate(@output)
  end
  
  private
  
  def output_query_results(spec_tuples)
    gems_info = {}
    spec_tuples.each do |tuple|
      name, version, arch = tuple[0][0], tuple[0][1], tuple[0][2]
      gems_info[name] ||= GemInfoHash.new
      gems_info[name][:versions] << version
      gems_info[name][:architectures] << {:version => version, :arch => arch}
    end
    
    @output[:gems] = gems_info
  end
  
  def say(message=nil)
    @output[:messages] << message if message
  end
  
end
