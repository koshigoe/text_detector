require 'spec_helper'

RSpec.describe TextDetector::Dictionary do
  describe '.factory' do
    context 'ファイル辞書' do
      let(:dictionary) { open(File.absolute_path('../data/text_detector/dictionary.txt', File.dirname(__FILE__))) }
      subject { described_class.factory dictionary }
      it { is_expected.to a_kind_of(TextDetector::Dictionary::File) }
    end

    context 'StringIO' do
      let(:dictionary) { StringIO.new }
      subject { described_class.factory dictionary }
      it { is_expected.to a_kind_of(TextDetector::Dictionary::File) }
    end
  end
end





