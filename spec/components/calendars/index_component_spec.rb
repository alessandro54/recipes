# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Calendars::IndexComponent, type: :component do
  let(:user) { create(:user, first_name: 'John', last_name: 'Doe') }
  let(:calendar) { create(:calendar, title: 'Example Title 1', owners: [user]) }

  it 'renders component' do
    render_inline(described_class.new(calendar:))

    expect(page).to have_text 'Example Title 1'
    expect(page).to have_text 'JD'
    expect(page).to have_text 'No recipes'
  end
end
