require 'spec_helper'

describe Goose::Config do

  it 'has on <li> as the default wrapper tag' do
    subject.wrapper_tag.should == :li
  end

  it 'applies a class attribute by default when active' do
    subject.active_options.should == {:class => 'active'}
  end

  it 'applies no inactive attributes by default when inactive' do
    subject.inactive_options.should == {}
  end

  it 'calls link_to by default to create breadcrumbs' do
    view = double(link_to: :linked)
    view.should_receive(:link_to).with(1, 2, 3)
    subject.breadcrumb_linker.(view, 1, 2, 3)
  end

end
