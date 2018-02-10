module Wiper
  describe Squeegee do
    context 'constructor' do
      it 'has defaults' do
        s = Squeegee.new

        expect(s.grid).to eq [[0] * 45] * 7
      end

      it 'takes a block' do
        s = Squeegee.new do |s|
          s.grid = [[1] * 45] * 7
        end

        expect(s.grid[0][0]).to eq 1
      end
    end

    context 'simple wipe' do
      s = Squeegee.new

      it 'draws the first column' do
        s.wipe

        s.grid.each do |row|
          expect(row[0]).to eq 1
          expect(row[1..44].all? { |i| i == 0 }).to be true
        end
      end

      it 'cleans up after itself' do
        s.wipe

        s.grid.each do |row|
          expect(row[0]).to eq 0
          expect(row[1]).to eq 1
          expect(row[2..44].all? { |i| i == 0 }).to be true
        end
      end

      it 'goes all the way across' do
        43.times do
          s.wipe
        end

        s.grid.each do |row|
          expect(row[0..43].all? { |i| i == 0 }).to be true
          expect(row[44]).to eq 1
        end
      end

      it 'exposes an iterator' do
        sq = Squeegee.new

        count = 0
        sq.each do |grid|
          expect(grid[0].index 1).to eq count
          count += 1
        end
      end
    end
  end
end
