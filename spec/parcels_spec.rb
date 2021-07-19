require 'rspec'
require 'parcel'

describe '#Parcel' do

  before(:each) do
    Parcel.clear()
  end

  describe('.all') do
    it("returns an empty array when there are no parcels") do
      expect(Parcel.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves aa parcel") do
      parcel = Parcel.new(1, 2, nil)
      parcel.save()
      parcel2 = Parcel.new(3, 4, nil)
      parcel2.save()
      expect(Parcel.all).to(eq([parcel, parcel2]))
    end
  end

  describe('#==') do
    it("is the same parcel if it has the same attributes as another parcel") do
      parcel = Parcel.new(1, 2, nil)
      parcel2 = Parcel.new(1, 2, nil)
      expect(parcel).to(eq(parcel2))
    end
  end

  describe('.clear') do
    it("clears all parcels") do
      parcel = Parcel.new(5, 6, nil)
      parcel.save()
      parcel2 = Parcel.new(7, 8, nil)
      parcel2.save()
      Parcel.clear()
      expect(Parcel.all).to(eq([]))
    end
  end

  describe('.find') do
    it("finds a parcel by id") do
      parcel = Parcel.new(5, 6, nil)
      parcel.save()
      parcel2 = Parcel.new(7, 8, nil)
      parcel2.save()
      expect(Parcel.find(parcel.id)).to(eq(parcel))
    end
  end

  describe('#update') do
    it("updates a parcel by id") do
      parcel = Parcel.new(5, 6, nil)
      parcel.save()
      parcel.update_weight(1)
      parcel.update_volume(2)
      expect(parcel.weight).to(eq(1))
      expect(parcel.volume).to(eq(2))
    end
  end

  describe('#delete') do
    it("deletes a parcel by id") do
      parcel = Parcel.new(5, 6, nil)
      parcel.save()
      parcel2 = Parcel.new(7, 8, nil)
      parcel2.save()
      parcel.delete()
      expect(Parcel.all).to(eq([parcel2]))
    end
  end
end