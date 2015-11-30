class Member < ActiveRecord::Base
  belongs_to :group
  has_many :tasks

  before_create :init

  private

    def init
      self.points = 0
    end
end
