require 'json'

class FileManager
  def save_file(path, file)
    File.write(path, to_json(file)) if file.size.positive?
  end

  def get_file(path)
    response = []
    response = from_json(File.read(path)) if File.exist?(path)
    response
  end

  def to_hash(object)
    hash = {}
    object.instance_variables.each do |var|
      hash[var.to_s.delete('@')] = object.instance_variable_get(var)
    end
    hash
  end

  private

  def to_json(file)
    JSON.pretty_generate(file)
  end

  def from_json(file)
    JSON.parse(file)
  end
end
