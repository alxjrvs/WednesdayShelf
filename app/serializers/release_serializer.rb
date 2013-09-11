class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :release_date, :next, :previous, :long_release_date
  embed :ids, include: true
  has_many :issues

  def next
    object.next.try(:id)
  end

  def previous
    object.previous.try(:id)
  end

  def long_release_date
    object.release_date.stamp('Wednesday, September 30th, 2013')
  end
end
