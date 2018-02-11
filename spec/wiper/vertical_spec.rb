module Wiper
  describe Squeegee do
    context 'top-to-bottom' do
      s = Squeegee.new do |s|
        s.direction = :south
      end

      it 'starts at the top' do
        s.wipe

        expect(s.grid[0].all? { |i| i == 1 }).to be true
        6.times do |index|
          expect(s.grid[index + 1].all? { |i| i == 0 }).to be true
        end
      end

      it 'cleans up after itself' do
        s.wipe

        expect(s.grid[0].all? { |i| i == 0 }).to be true
        expect(s.grid[1].all? { |i| i == 1 }).to be true
        5.times do |index|
          expect(s.grid[index + 2].all? { |i| i == 0 }).to be true
        end
      end
    end

    context 'wipe bottom-to-top' do
      s = Squeegee.new do |s|
        s.direction = :north
        s.curtain = true
      end

      it 'starts at the bottom' do
        s.wipe

        expect(s.grid[6].all? { |i| i == 1 }).to be true
        6.times do |index|
          expect(s.grid[index].all? { |i| i == 0 }).to be true
        end
      end

      it 'draws the curtain behind itself' do
        s.wipe

        2.times do |index|
          expect(s.grid[index + 5].all? { |i| i == 1 }).to be true
        end

        5.times do |index|
          expect(s.grid[index].all? { |i| i == 0 }).to be true
        end
      end
    end

    it 'exposes the to_dots API' do
      s = Squeegee.new do |s|
        s.direction = :north
      end

      expect(s.grid.to_dots).to eq [[0] * 45] * 7
    end

    it 'exposes an iterator' do
      s = Squeegee.new do |s|
        s.direction = :south
      end

      count = 0
      s.each do
        count += 1
      end
      expect(count).to eq 7
    end
  end
end
