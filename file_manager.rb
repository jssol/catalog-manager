require 'json'

def to_json(file)
  JSON.pretty_generate(file)
end

def from_json(file)
  JSON.parse(file)
end

def save_file(path, file)
  File.write(path, to_json(file))
end

def get_file(path)
  response = []
  response = from_json(File.read(path)) if File.exist?(path)
  response
end
