# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Days::Show::DesktopComponent, type: :component do
  let(:recipe) { create :recipe, title: 'Pho', duration: 130 }
  let(:day) { create :day, recipe:, when: Date.new(2023, 8, 15) }
  it 'renders component' do
    payload = {
      date:  Date.new(2023, 8, 14),
      month: 8,
      day:
    }
    render_inline(described_class.new(calendar_id: day.calendar.id, payload:))

    expect(page).to have_text 'Pho'
    expect(page).to have_text '2h 10m'
  end
end
