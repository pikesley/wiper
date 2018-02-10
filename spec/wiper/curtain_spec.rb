module Wiper
  describe Squeegee do
    context 'fill in behind the wiper' do
      s = Squeegee.new do |s|
        s.curtain = true
      end

      it 'fills in as it sweeps across' do
        3.times do
          s.wipe
        end

        expect(s.grid[0][0..5]).to eq [1, 1, 1, 0, 0, 0]
      end
    end
  end
end
