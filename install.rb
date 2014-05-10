require 'pry'

@process = File.basename($0)

def log(message)
  puts "[\e[36m#{@process}\e[0m] [#{Time.new.strftime('%d/%m/%Y-%H:%M')}]: #{message}"
end

def log_yield(message)
  log("##################################################")
  log("\e[33m#{message}\e[0m")
  log("##################################################")
end

def call(command)
  log(command)
  system(command)
end

def execute(mandatory_params=nil)
  log_yield "BEGIN #{@process} with ARGV='#{ARGV.inspect}'"
  params = extract_params
  validate_params(params, mandatory_params)
  yield params
  log_yield "END #{@process}"
end

def extract_params
  params = Hash.new
  ARGV.map do |arg|
    param = arg.split('=')
    params[param[0].downcase.to_sym] = param[1]
  end
  log "params=#{params.inspect}"
  params
end

def validate_params(params, mandatory_params)
  Array(mandatory_params).each do |p|
    raise ArgumentError.new("Must have a param=#{p}.") unless params[p]
  end
end

execute do
  Dir.foreach('./dotfiles/') do |file|
    next if file == '.' or file == '..'
    call("rm ~/#{file}")
    call("ln -s #{Dir.pwd}/dotfiles/#{file} ~/#{file}")
  end
end
