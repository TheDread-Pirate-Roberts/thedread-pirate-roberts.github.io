require 'erb'
require_relative 'api'
require 'json'
require 'time'

loop do
  begin
    erb = ERB.new(File.open("#{__dir__}/../index.html.erb").read)
    erb1 = File.read("#{__dir__}/../index.html")
    if erb.result != erb1
      File.open("#{__dir__}/../index.html", 'w') {|file| file.write("#{erb.result}")}
      puts "Saving new file @ #{Time.now.strftime("%r")}"
    end
    rescue => std_error
      puts std_error
      sleep(2)
    rescue SyntaxError, NameError => syn_error
      puts syn_error
      sleep(2)
    end
end

#todo in rescue, call write over index.hmtl with syntax error
#like rails
