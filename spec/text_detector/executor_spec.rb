require 'spec_helper'

RSpec.describe TextDetector::Executor do
  describe '#detect' do
    let(:dictionary) { open(File.absolute_path('../data/text_detector/dictionary.txt', File.dirname(__FILE__))) }
    subject { described_class.new(type, dictionary).detect(text) }

    shared_examples_for 'text detect' do
      context '検出対象文字列を含まない' do
        let(:text) { '--- NGワード ---' }
        it { is_expected.to be_nil }
      end

      context '検出対象文字列で始まる' do
        let(:text) { 'NGわーど1 ---' }
        it { is_expected.to eq('NGワード1') }
      end

      context '検出対象文字列を含む' do
        let(:text) { '--- NGわーど1 ---' }
        it { is_expected.to eq('NGワード1') }
      end

      context '検出対象文字列で終わる' do
        let(:text) { '--- NGわーど1' }
        it { is_expected.to eq('NGワード1') }
      end
    end

    context 'type = :simple' do
      let(:type) { :simple }
      it_should_behave_like 'text detect'
    end

    context 'type = :regexp' do
      let(:type) { :regexp }
      it_should_behave_like 'text detect'
    end
  end
end
