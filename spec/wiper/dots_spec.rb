module Wiper
  describe Squeegee do
    it 'exposes the to_dots API' do
      s = Squeegee.new

      expect(s.grid.to_dots).to eq [[0] * 45] * 7
    end
  end
end
