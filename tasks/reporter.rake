namespace :reporter do
  to_copy = ["jquery.js", "jquery-ui.min.js", "reporter.js"]

  # install
  desc 'Copies required scripts files to the public/javascripts directory.'
  task :install do

    # inform the user of whats happening
    puts "Copying #{to_copy.to_sentence} to public/javascripts/..."

    success = true

    to_copy.each do |script|
       # copy from
      destination = File.join(RAILS_ROOT, "/public/javascripts/", script)

      # copy to
      source = File.join(RAILS_ROOT + "/vendor/plugins/reporter/javascripts/", script)

      # copy
      success = false unless FileUtils.cp_r(source, destination)
    end

    puts "Required scripts copied successfully!"
  end

  # uninstall
  desc 'Removes required scripts from the public/javascripts directory.'
  task :uninstall do
    FileUtils.rm_r to_copy.collect { |script| RAILS_ROOT + "/public/javascripts/" + script }

    puts "#{to_copy.to_sentence} removed successfully."
  end
end
