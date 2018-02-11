module Wiper
  describe Squeegee do
    context 'animation frames' do
      s = Squeegee.new do |s|
        s.grid = [[1] * 45] * 7
      end

      it 'exposes the to_dots API' do
        expect(s.grid.to_dots).to eq [[1] * 45] * 7
      end

      it 'has an animtype' do
        expect(s.grid.animtype).to eq :tween
      end
    end
  end
end
