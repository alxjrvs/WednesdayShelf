class ReleaseSerializer < ActiveModel::Serializer
  attributes :id, :release_date, :next, :previous
  has_many :issues

  def next
    object.next.try(:id)
  end

  def previous
    object.previous.try(:id)
  end
end
