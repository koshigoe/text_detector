require 'spec_helper'

RSpec.describe TextDetector::Executor do
  let(:dictionary) { open(File.absolute_path('../data/text_detector/dictionary.txt', File.dirname(__FILE__))) }

  describe '#detect' do
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

  describe '#detect_all' do
    subject { described_class.new(type, dictionary).detect_all(text) }

    shared_examples_for 'text detect all' do
      context '検出対象文字列を含まない' do
        let(:text) { '--- NGワード ---' }
        it { is_expected.to eq [] }
      end

      context '検出対象文字列で始まる' do
        let(:text) { 'NGわーど1 NGわーど2 NGわーど3 NGわーど4 NGわーど5 NGわーど6 NGわーど7 NGわーど8 NGわーど9 ---' }
        it { is_expected.to match_array(%w(NGワード1 NGワード2 NGワード3 NGワード4 NGワード5 NGワード6 NGワード7 NGワード8 NGワード9)) }
      end

      context '検出対象文字列を含む' do
        let(:text) { '--- NGわーど1 NGわーど2 NGわーど3 NGわーど4 NGわーど5 NGわーど6 NGわーど7 NGわーど8 NGわーど9 ---' }
        it { is_expected.to match_array(%w(NGワード1 NGワード2 NGワード3 NGワード4 NGワード5 NGワード6 NGワード7 NGワード8 NGワード9)) }
      end

      context '検出対象文字列で終わる' do
        let(:text) { '--- NGわーど1 NGわーど2 NGわーど3 NGわーど4 NGわーど5 NGわーど6 NGわーど7 NGわーど8 NGわーど9' }
        it { is_expected.to match_array(%w(NGワード1 NGワード2 NGワード3 NGワード4 NGワード5 NGワード6 NGワード7 NGワード8 NGワード9)) }
      end
    end

    context 'type = :simple' do
      let(:type) { :simple }
      it_should_behave_like 'text detect all'
    end

    context 'type = :regexp' do
      let(:type) { :regexp }
      it_should_behave_like 'text detect all'
    end
  end
end
