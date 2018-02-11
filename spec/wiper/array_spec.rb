describe Array do
  it 'transposes itself in-place' do
    a = [[0, 0], [0, 0], [0, 0]]
    a.transpose!
    expect(a).to eq [
      [0, 0, 0],
      [0, 0, 0]
    ]
  end
end
