require 'rails_helper'

# RSpec.describe Widget, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe '#id' do
  it 'should not exist for new records' do
    @widget = Widget.new
    expect(@widget.id).to be_present
  end

  it 'should be auto-assigned by AR for saved records' do
    @widget = Widget.new
    # we use bang here b/c we want our spec to fail if save fails (due to validations)
    # we are not testing for successful save so we have to assume it will be successful
    @widget.save!

    expect(@widget.id).to be_present
  end
end
