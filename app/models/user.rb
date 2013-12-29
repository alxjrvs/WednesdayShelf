class User < ActiveRecord::Base
  after_create :add_pull_list
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  has_one :pull_list, -> {includes(:series)}

  def subscribed_to?(issue)
    pull_list.series.include? issue.series
  end

  def avatar
    ActionController::Base.helpers.image_tag("default.png")
  end

  private

  def add_pull_list
    self.pull_list ||= PullList.create!
  end
end
