class LRUCache
  attr_reader :size

  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache.push(el)
    else
      if self.count < self.size
        @cache.push(el)
      else
        @cache.shift
        @cache.push(el)
      end
    end
  end

  def show
    print @cache
  end

end
