require 'spec_helper'

describe TextDetector do
  describe '.factory' do
    subject { described_class.factory(:type, :dictionary) }

    it do
      expect(TextDetector::Executor).to receive(:new).with(:type, :dictionary)
      subject
    end
  end

  describe '.normalize' do
    subject { described_class.normalize(text) }

    context 'ひらがな' do
      let(:text) { 'ひらがな' }
      it { is_expected.to eq 'ヒラガナ' }
    end

    context '半角カナ' do
      let(:text) { 'ﾊﾝｶｸｶﾅ' }
      it { is_expected.to eq 'ハンカクカナ' }
    end

    context 'a\u0300' do
      let(:text) { "a\u0300" }
      it { is_expected.to eq "\u00E0" }
    end
  end
end
