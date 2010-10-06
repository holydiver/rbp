require 'tempfile'
require 'fileutils'

temp = Tempfile.new("working")
File.foreach(ARGV[0]) do |line|
  temp << line unless line =~ /^\s*#/
end

temp.close
FileUtils.cp(ARGV[0],"#{ARGV[0]}.bak")
FileUtils.mv(temp.path,ARGV[0])
