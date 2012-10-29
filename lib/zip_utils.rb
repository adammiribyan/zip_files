require 'fileutils'

module ZipUtils
  # creates a zip filename in tmp directory with all carrierwave files.
  # returns path to the compressed filename.
  def compress_files_into_filename(files,filename,tmp_directory)
    return nil if files.empty?

    FileUtils.mkdir_p(tmp_directory)
    t = Tempfile.new([filename,".zip"], tmp_directory)

    file_root_path = "#{Rails.root}/public"

    Zip::ZipOutputStream.open(t.path) do |zos|
      files.each do |file|
        begin
          open("#{file_root_path}#{file.file_url}") do |f|
            Rails.logger.warn "WRITING #{file.name}"

            zos.put_next_entry("#{file.name}")
            zos.write f.read
          end
        rescue Exception=>e
          Rails.logger.warn "WARNING: Failed to open #{file.file_url}"
        end
      end
    end

    t.close
    return t.path
  end

  # zip file naming common rule
  def zip_file_name(project, type)
    "#{project.name.parameterize('_')}_#{type}-files_"
  end
end
