class Parcel
  attr_reader :id
  attr_accessor :weight, :volume
  @@parcels = {}
  @@total_rows = 0
  
  def initialize(weight, volume, id)
    @weight = weight
    @volume = volume
    @id = id || @@total_rows += 1
  end
  
  def self.all
    @@parcels.values()
  end

  def save
    @@parcels[self.id] = Parcel.new(self.weight, self.volume, self.id)
  end
  
  def ==(parcel_to_compare)
    (self.weight() == parcel_to_compare.weight()) && (self.volume() == parcel_to_compare.volume())
  end

  def self.clear
    @@parcels = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@parcels[id]
  end

  def update_weight(weight)
    @weight = weight
  end
  
  def update_volume(volume)
    @volume = volume
  end

  def delete
    @@parcels.delete(self.id)
  end
end