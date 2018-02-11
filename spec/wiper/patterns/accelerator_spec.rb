module Wiper
  module Patterns
    describe Accelerator do
      it 'gets faster' do
        a = Accelerator.new

        a.each do |frame|
        end

        expect(a.squeegee.interval).to eq 0.008727963568087723
      end
    end
  end
end
