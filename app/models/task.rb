class Task < ActiveRecord::Base
  belongs_to :group
  belongs_to :member

  before_create :set_done

  private

    def set_done
      self.done = false
    end
end
