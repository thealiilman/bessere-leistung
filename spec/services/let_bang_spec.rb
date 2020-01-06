# https://relishapp.com/rspec/rspec-core/v/2-5/docs/helper-methods/let-and-let#use-let!-to-define-a-memoized-helper-method-that-is-called-in-a-before-hook
$count = 0
describe "let!" do
  let(:invocation_order) { [] }

  let!(:count) do
    invocation_order << :let!
    $count += 1
  end

  it "calls the helper method in a before hook" do
    invocation_order << :example
    expect(invocation_order).to eq([:let!, :example])
    expect(count).to eq(1)
  end
end