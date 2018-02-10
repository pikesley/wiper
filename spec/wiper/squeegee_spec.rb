module Wiper
  describe Squeegee do
    context 'constructor' do
      it 'has defaults' do
        s = Squeegee.new

        expect(s.starter).to eq [[0] * 45] * 7
      end
    end
  end
end
