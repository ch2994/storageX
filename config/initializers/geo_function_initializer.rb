class Geo_function_initializer

  attr_reader :azure_map_key

  def initialize()
    @azure_map_key = ENV["AZURE_MAP_KEY"]
  end
end