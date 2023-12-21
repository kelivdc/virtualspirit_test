require 'digest'

def hitung_folder(folder_path)
    content_counts = Hash.new(0)
    max_content = ['', 0]
  
    Dir.glob(File.join(folder_path, '*')).each do |file_path|
      next unless File.file?(file_path)
  
      content = File.read(file_path)
      content_hash = Digest::SHA256.hexdigest(content)
  
      content_counts[content_hash] += 1
  
      if content_counts[content_hash] > max_content[1]
        max_content = [content, content_counts[content_hash]]
      end
    end
  
    puts "#{max_content[0]} #{max_content[1]}"
end

# Change folder name if you want to scan another folder
# Example:
folder_path = ARGV[0] || 'files'
hitung_folder(folder_path)