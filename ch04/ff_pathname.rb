require 'pathname'

WORKING_DIR = Pathname.getwd
LOADER = %Q{
  require "pathname"

  Pathname.glob("#{WORKING_DIR}/vendor/*/*/") do |dir|
    lib = dir + "lib"
    $LOAD_PATH.push(lib.directory? ? lib : dir)
  end
}

if ARGV[0] == "init"
  lib = Pathname.new(ARGV[1])
  lib.mkpath
  (lib + 'dependencies.rb').open("w") do |file|
    file.write LOADER
  end
else
  vendor = Pathname.new("vendor")
  vendor.mkpath
  Dir.chdir(vendor.realpath)
  system("git clone git@github.com/#{ARGV[0]}.git #{ARGV[0]}")
  if ARGV[1]
    Dir.chdir(ARGV[0])
    system("git checkout #{ARGV[1]}")
  end
end
