module FileUploader
  class FileUploader
    PATH = Dir.pwd + "/public/images/users/"
    HOST = "http://localhost:3000/images/users/"

    def initialize
      super
    end

    def save_user_image(base64_image_object)
      image_contents = base64_image_object['contents']
      image_type =  base64_image_object['file_type'].to_s
      save_image_file(image_contents,image_type)
    end



    private
    def save_image_file(image_contents,image_type)
      base64_image_type = "data:"+image_type+";base64,"
      image_data = Base64.decode64(image_contents[base64_image_type.length .. -1])
      image_extension = image_type.split("/",2)[1]
      image_new_name = generate_string(12)+"."+image_extension
      image_path = PATH + image_new_name
      new_file=File.new(image_path, 'wb')
      new_file.write(image_data)
      HOST + image_new_name
    end

    private

    def generate_string(size)
      o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
      (0...size).map { o[rand(o.length)] }.join
    end


  end
end