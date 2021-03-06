class EncounterPresenter
  attr_reader :encounter

  def initialize(encounter)
    @encounter = encounter
  end

  def published
    encounter.published.to_s.capitalize
  end

  def title
    encounter.title || default_title
  end

  def category
    encounter.category.name.titleize
  end

  def description
    encounter.description
  end

  def events
    encounter.events
  end

  def starting_event
    encounter.starting_event
  end

  private

  def default_title
    "Encounter ##{encounter.id}"
  end
end
