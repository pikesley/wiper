module Wiper
  describe Squeegee do
    context 'wipe right-to-left' do
      s = Squeegee.new do |s|
        s.direction = :west
      end

      it 'has the right number of elements' do
        expect(s.grid[0].length).to eq 45
      end

      it 'starts at the right' do
        s.wipe

        s.grid.each do |row|
          expect(row[44]).to eq 1
          expect(row[0..43].all? { |i| i == 0 }).to be true
        end
      end

      it 'moves left' do
        s.wipe

        s.grid.each do |row|
          expect(row[44]).to eq 0
          expect(row[43]).to eq 1
          expect(row[0..42].all? { |i| i == 0 }).to be true
        end
      end

      it 'exposes an iterator' do
        sq = Squeegee.new do |s|
          s.direction = :west
        end

        count = 44
        sq.each do |grid|
          unless count == -1
            expect(grid[0].index 1).to eq count
          end
          count -= 1
        end

        expect(sq.grid[0].length).to eq 45
      end
    end
  end
end
