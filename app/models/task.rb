class Task < ActiveRecord::Base
  belongs_to :group
  belongs_to :member

  before_create :init

  def due_date_date
    ret = {}
    date = self.due_date
    ret[:year] = date.year
    ret[:month] = date.month
    ret[:day] = date.day
    ret
  end

  def as_json(options = {})
    obj = super(except: :due_date)
    obj[:due_date] = due_date_date
    obj
  end

  private

    def init
      self.done = false
      self.days_per_cycle = 7
    end
end
