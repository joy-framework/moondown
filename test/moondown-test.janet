(import tester :prefix "" :exit true)
(import build/moondown :as md)

(deftest
  (test "render works"
    (= "<h1>Hello world</h1>\n" (md/render "# Hello world")))

  (test "indented multiline code blocks works"
    (= "<h1>Title</h1>\n\n<pre><code>body\n</code></pre>\n" (md/render "# Title\n    body")))

  (test "html is escaped"
    (= "<pre><code>&lt;script&gt;alert(&#39;hello&#39;);&lt;/script&gt;\n</code></pre>\n\n<p>&lt;script&gt;alert(&#39;malicious!&#39;)&lt;/script&gt;</p>\n"
       (md/render "    <script>alert('hello');</script>\n<script>alert('malicious!')</script>")))

  (test "link md is escaped"
    (= "<p><a href=\"%22javascript:alert(&#x27;hello&#x27;\">malicious!</a>&quot;)</p>\n"
       (md/render "[malicious!](\"javascript:alert('hello')\")")))

  (test "link html is escaped"
    (= "<p>&lt;a href=&quot;javascript:alert(&#39;hello &gt;:)&#39;)&quot;&gt;malicious!&lt;/a&gt;</p>\n"
       (md/render "<a href=\"javascript:alert('hello >:)')\">malicious!</a>"))))
