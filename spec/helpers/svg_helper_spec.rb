# frozen_string_literal: true

RSpec.describe SvgHelper, type: :helper do
  describe '#svg' do
    it 'returns an svg tag' do
      doc = Nokogiri::XML(svg('plus'))

      d = doc.at_css('svg').at_css('path')['d']

      expect(d).to eq 'M12 4.5v15m7.5-7.5h-15'
    end
  end
end
