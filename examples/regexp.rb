$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'stringio'
require 'text_detector'

dictionary = StringIO.new(<<EOF)
NG_A
NG_B
NG_C
EOF

regexp_detector = TextDetector.factory(:regexp, dictionary)

p regexp_detector.detect('This document not include NG words.')
p regexp_detector.detect('This document include NG words: NG_A')
