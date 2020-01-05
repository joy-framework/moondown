(import tester :prefix "" :exit true)
(import build/moondown :as md)

(deftest
  (test "render works"
    (= "<h1>Hello world</h1>\n" (md/render "# Hello world")))

  (test "multiline render works"
    (= "<h1>Title</h1>\n\n<p><code>body</code></p>\n" (md/render "# Title\n```body```"))))
