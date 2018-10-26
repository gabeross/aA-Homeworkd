class Map
  def initialize
    @map = []
  end

  def key_exists?(key, pair)
    pair.first == key
  end

  def set(key, value)
    @map.each do |pair|
      if key_exists?(key, pair)
        pair[1] = value
        return @map
      end
    end
    @map << [key, value]
  end

  def get(key)
    @map.each do |pair|
      value = pair.last
      return value if key_exists?(key, pair)
    end
    nil
  end

  def delete(key)
    @map.each do |pair|
      if key_exists?(key, pair)
        value = pair.last
        @map.delete([key, value])
      end
    end
  end

  def show
    @map
  end

end
