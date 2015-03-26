require 'nkf'
require 'text_detector/version'
require 'text_detector/executor'

module TextDetector
  def self.factory(type, dictionary)
    Executor.new type, dictionary
  end

  def self.normalize(text)
    NKF.nkf('--katakana -w', text).unicode_normalize(:nfc)
  end
end
