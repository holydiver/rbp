require 'tempfile'
require 'fileutils'

temp = Tempfile.new("working")
File.foreach(ARGV[0]) do |line|
  temp << line unless line =~ /^\s*#/
end

temp.close
FileUtils.mv(temp.path,ARGV[0])
