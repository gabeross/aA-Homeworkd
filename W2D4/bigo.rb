def sluggish(fishes)
  fishes.each_index do |i|
    biggest = true
    fishes.each_index do |j|
      next if i == j

      biggest = false if fishes[j].length > fishes[i].length
    end
    return fishes[i] if biggest == true
  end
end

class Array

  def merge_sort(&prc)
    prc ||= Proc.new{ |el1, el2| el1 <=> el2 }
    return self if self.length <= 1
    mid = self.length / 2
    left_arr = self[0...mid].merge_sort(&prc)
    right_arr = self[mid..-1].merge_sort(&prc)
    self.class.merge(left_arr, right_arr, &prc)
  end

  def self.merge(left, right, &prc)
    main_merge = []
    until left.empty? || right.empty?
      if prc.call(left.first, right.first) == -1
        main_merge << left.shift
      else
        main_merge << right.shift
      end
    end
    main_merge + left + right
  end

end

def dominant(fishes)
  prc = Proc.new { |el1, el2| el2.length <=> el1.length }
  fishes.merge_sort(&prc)[0]
end

def clever(fishes)
  biggest = fishes[0]
  fishes.each do |fish|
    if fish.length > biggest.length
      biggest = fish
    end
  end
  biggest
end
