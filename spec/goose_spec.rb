require 'spec_helper'

describe Goose do

  describe '.config' do
    subject { Goose.config }
    it { should be_a(Goose::Config) }
  end

  describe '.setup' do
    it 'yields the configuration' do
      config = nil
      Goose.setup { |c| config = c }
      config.should be_a(Goose::Config)
    end
  end

end
