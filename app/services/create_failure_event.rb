class CreateFailureEvent
  def initialize(event:, option:)
    @event = event
    @option = option
  end

  def save
    if option.failure_event
      event.errors.add(:base, message: "This Option already has a Failure Event.")
      return false
    end

    prepare_event_for_save

    return false if !event.save
    return false if !option.update_attribute(:failure_event_id, event.id)

    true
  end

  private

  attr_reader :event, :option

  def prepare_event_for_save
    role_responses = event.responses
    valid_responses = role_responses.reject { |role_response|
      role_response.text.blank?
    }
    event.responses = valid_responses
  end
end
