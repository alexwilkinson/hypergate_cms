class Option < ActiveRecord::Base
  belongs_to :event
  belongs_to :success_event, class_name: Event
  belongs_to :failure_event, class_name: Event
  belongs_to :required_role, class_name: Role
  belongs_to :required_module, class_name: ShipModule
  belongs_to :required_item, class_name: Item

  validates_presence_of :text, :order
end
