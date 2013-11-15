class User < ActiveRecord::Base
  after_create :add_pull_list
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :username, presence: true
  validates :name, presence: true
  has_one :pull_list

  private

  def add_pull_list
    self.pull_list ||= PullList.create!
  end
end
