require 'spec_helper'

class TestController < ActionController::Base
end

describe Goose::Helper do

  before do
    path = ActionView::FileSystemResolver.new(fixture_load_path)
    view_paths = ActionView::PathSet.new([path])
    ActionView::FileSystemResolver.new(fixture_load_path).should == view_paths.first
    setup_view(view_paths)
  end

  it 'renders and applies active configuration to simple nav_to' do
    @view.render(file: 'one')
    rendered_nav.at('li.active').text.should == "One"
  end

  it 'renders and applies active configuration to block nav_to' do
    @view.render(file: 'three')
    rendered_nav.at('li.active a.custom-link-class').text.should == "Three"
  end

  def fixture_load_path
    File.expand_path '../fixtures', __FILE__
  end

  def rendered_nav
    Nokogiri(@view.content_for(:main_navigation))
  end

  def setup_view(paths)
    @assigns = { :secret => 'in the sauce' }
    @view = ActionView::Base.new(paths, @assigns)
    @controller_view = TestController.new.view_context    
  end

end
