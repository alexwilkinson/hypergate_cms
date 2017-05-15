class Option < ActiveRecord::Base
  belongs_to :event
  belongs_to :success_event, class_name: Event, dependent: :destroy
  belongs_to :failure_event, class_name: Event, dependent: :destroy
  belongs_to :required_role, class_name: Role
  belongs_to :skill_check, dependent: :destroy

  validates_presence_of :text, :order

  accepts_nested_attributes_for :skill_check
end
