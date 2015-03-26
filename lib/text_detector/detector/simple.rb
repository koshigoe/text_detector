require_relative 'base'

module TextDetector
  module Detector
    # BM法っぽく(トライ木を調べてる時に見かけた実装を参考に)
    class Simple < Base
      def detect(text)
        # 0文字目から末尾の一つ前まで一文字ずつ始点を移動していく
        0.upto(text.size - 1) do |start|
          # 語の長さ配列から切り出し文字数を取り出していく
          dictionary.depth.each do |size|
            target = text[start, size]
            # 切り出した文字列の長さが、切り出し分より短ければ次のターン
            break if size > target.size

            # 切り出した文字列が辞書に含まれていれば探索終了
            return target if dictionary.lookup(target)
          end
        end

        nil
      end
    end
  end
end
