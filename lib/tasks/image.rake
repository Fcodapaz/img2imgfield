namespace :image do 
  desc 'Migration all Image module content to ImageField drupal module'
  
  task all: [:images]

  task :images => :environment do 
    puts "Time: #{Time.now}"
    puts "#{ ImageAttach.count } attach images"
    puts "#{ Image.count } images"
    j=0
    begin
      ImageAttach.find_each do |i|
        if Node.exists?(i.nid) && !i.image.nil?
          node = Node.find(i.nid)
          img = ImageField.new
          img.vid = node.vid
          img.field_image_fid = i.image.file.fid
          img.field_image_list = 0
          img.field_image_data = "a:3:{s:11:\"description\";s:#{i.image.node.title.size}:\"#{i.image.node.title}\";s:3:\"alt\";s:#{i.image.node.title.size}:\"#{i.image.node.title}\";s:5:\"title\";s:#{i.image.node.title.size}:\"#{i.image.node.title}\";}"
          img.save!
          node.image_field = img
          j = j + 1
        end
      end

    rescue  Exception => e
      puts "Error: #{e}"
    end
    puts "Time: #{Time.now}"
    puts "#{j} attached images migrated"
  end

end
