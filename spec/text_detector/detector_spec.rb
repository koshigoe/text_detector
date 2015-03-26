require 'spec_helper'

RSpec.describe TextDetector::Detector do
  describe '.factory' do
    let(:dictionary_file) { open(File.absolute_path('../data/text_detector/dictionary.txt', File.dirname(__FILE__))) }
    let(:dictionary) { TextDetector::Dictionary.factory(dictionary_file) }
    subject { described_class.factory(type, dictionary) }

    context 'type = simple' do
      let(:type) { :simple }
      it { is_expected.to a_kind_of(TextDetector::Detector::Simple) }
    end

    context 'type = regexp' do
      let(:type) { :regexp }
      it { is_expected.to a_kind_of(TextDetector::Detector::Regexp) }
    end

    context 'type = unknown' do
      let(:type) { :unknown }
      it { expect { subject }.to raise_error(NameError) }
    end
  end
end
