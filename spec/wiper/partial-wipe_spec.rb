module Wiper
  describe Squeegee do
    it 'stops part-way' do
      sq = Squeegee.new do |s|
        s.limit = 40
      end

      count = 0
      sq.each do
        count += 1
      end

      expect(count).to eq 40
    end
  end
end
