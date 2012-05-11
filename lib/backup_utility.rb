class BackupUtility
#  
#  Download the "7-Zip Command Line Version" from 7zip download page and unzip it.
#  http://www.7-zip.org/download.html
#
#  Use the following command to zip a folder:
#  7za a -tzip <archive-name> <folder-name>
#
#  e.g. 7za a -tzip test.zip "New Folder"

  def self.process
    setting = Setting.first
    zip_name = "#{Time.now.strftime('%Y%m%d_%H%M%S')}.zip"
    system("7za a -tzip #{setting.backup_path}#{zip_name} #{setting.source_path}")
  end
end