$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'stringio'
require 'text_detector'

dictionary = StringIO.new(<<EOF)
NG_A
NG_B
NG_C
EOF

simple_detector = TextDetector.factory(:simple, dictionary)

p simple_detector.detect('This document not include NG words.')
p simple_detector.detect('This document include NG words: NG_A')
