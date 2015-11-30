class Member < ActiveRecord::Base
  belongs_to :group
  has_many :tasks

  before_create :initialize

  private

    def initialize
      self.points = 0
    end
end
