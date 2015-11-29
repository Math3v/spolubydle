class Task < ActiveRecord::Base
  belongs_to :group
  belongs_to :member

  before_create :init

  private

    def init
      self.done = false
      self.days_per_cycle = 7
    end
end
