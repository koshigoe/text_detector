require 'nkf'
require 'text_detector/version'

module TextDetector
  def self.factory(type, dictionary)
    Executor.new type, dictionary
  end

  def self.normalize(text)
    NKF.nkf('--katakana -w', text).unicode_normalize(:nfc)
  end
end

require 'text_detector/dictionary'
require 'text_detector/dictionary/base'
require 'text_detector/dictionary/file'
require 'text_detector/detector'
require 'text_detector/detector/base'
require 'text_detector/detector/simple'
require 'text_detector/detector/regexp'
require 'text_detector/executor'
