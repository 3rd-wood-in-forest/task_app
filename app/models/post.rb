class Post < ApplicationRecord
  validates :title, presence: true
 validates :start_date, presence: true
 validates :last_date, presence: true
 validate :date_before_finish
end

def date_before_finish
 if last_date.blank?
   errors.add(:last_date, "は今日以降の日付で選択してください")
 elsif last_date < Date.today
   errors.add(:last_date, "は今日以降の日付で選択してください")
 else
   return
 end
end
