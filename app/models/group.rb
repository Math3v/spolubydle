class Group < ActiveRecord::Base

  has_many :members, -> { order(:id) }
  has_many :tasks, through: :members

  validates :name, presence: true
  validates :code, uniqueness: true

  before_create :generate_code

  def recalculate_tasks(today)
    self.tasks.each { |task| 
      @due_date = task.due_date
      @dif_date = (@due_date - today).to_i
      if @dif_date == 0
        # OK
      elsif task.done? && @dif_date > 0
        # OK
      elsif task.done? && @dif_date < 0
        # Assign task to next member
        next_member_id = next_member(task.member_id)
        update_member_points(task)
        task.update({member_id: next_member_id,
                     points: task.points_original,
                     due_date: today + task.days_per_cycle})
      elsif !task.done? && @dif_date > 0
        # OK
      elsif !task.done? && @dif_date < 0
        # Update points of task
        new_points = get_new_points(task.points_original)
        task.update(points: new_points.to_i)
      end
      task.save
    }
  end

  private

    def generate_code
      while true
        code = rand(36**8).to_s(36)
        break unless Group.exists?(code: code)
      end
      self.code = code
    end

    def member_ids
      self.members.map(&:id)
    end

    def next_member(id)
      ids = member_ids
      len = ids.length
      idx = ids.index(id)

      if idx == (len - 1)
        ids[0]
      else
        ids[idx + 1]
      end
    end

    def get_new_points(points)
      days = @dif_date.abs
      if days >= 4
        0
      else
        points.to_f * ((4 - days.to_f) / 4)
      end
    end

    def update_member_points(task)
      member = Member.find(task.member_id)
      points = member.points
      member.update({
        points: points + task.points
      })
    end
end
