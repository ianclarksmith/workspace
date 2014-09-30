#!/usr/bin/env ruby

require 'fileutils'

# Defaults
DESKTOP_DIR = File.expand_path("~/Desktop")
WORKSPACE_DIR = Dir.home # active workspace after setup
MAX_ITEMS = 100

# Remove ~/Desktop created automatically by OS X
def remove_desktop
  disposable = ['.localized', '.DS_Store']
  ignored = ['.', '..'] + disposable
  files = Dir.entries(DESKTOP_DIR).reject {|f| ignored.include? f}

  if files.empty?
    FileUtils.cd(DESKTOP_DIR)
    FileUtils.rm_f(disposable)
    `sudo rmdir #{DESKTOP_DIR}`
  else
    # For safety, you must do any house-cleaning yourself before proceeding
    puts "#{DESKTOP_DIR} is not empty"
  end
end

# Activate a workspace
def activate(dir)
  if File.symlink?(DESKTOP_DIR)
    dir = Dir.open(File.expand_path(dir))

    if dir.entries.size < MAX_ITEMS
      # Remove DESKTOP_DIR unless it already exists and is not a symlink
      FileUtils.safe_unlink(DESKTOP_DIR)
      puts "unlinking #{DESKTOP_DIR}..."

      # Place a symlink at DESKTOP_DIR
      File.symlink(dir, DESKTOP_DIR)
      puts "linking #{dir}..."

      refresh_desktop
    else
      puts "This directory has more than #{MAX_ITEMS} items."
      puts "If you would like to activate anyway, run with --ignore-max"
    end
  else
    # OS X Desktop folder must be removed to activate a workspace
    remove_desktop
  end
end

# Revert to OS X default Desktop folder
def deactivate
  FileUtils.safe_unlink(DESKTOP_DIR)
  puts "unlinking #{DESKTOP_DIR}"

  refresh_desktop
end

# Relaunch Finder... gracefully
def refresh_desktop
  `killall -SIGQUIT Finder`
end

command = ARGV.shift
case command
when 'activate'
  activate ARGV.shift
when 'deactivate'
  deactivate
when 'current'
  puts `readlink ~/Desktop`
else
  puts 'workspace - activate DIR_PATH, deactivate, current'
end
