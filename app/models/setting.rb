class Setting < ActiveRecord::Base
  before_save :check_directory, :check_trailing_slash

  
  protected
  
  def check_directory
    puts "start checking..."
    begin
      [backup_path, source_path].each do |folder|
        if not File.directory?(folder)
          Dir.mkdir(folder)
          puts "creating directory....."
        end
      end
    rescue
      self.backup_path = "#{Rails.root.to_s}\\public\\"
    end
    puts "End checking ..."
  end
  
  def check_trailing_slash
    if backup_path[-1] != "\\"
      self.backup_path += "\\" 
    end
    if source_path[-1] != "\\"
      self.source_path += "\\" 
    end
  end
  
end
