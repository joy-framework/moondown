(declare-project
  :name "moondown"
  :description "A janet markdown parsing library based on sundown"
  :author "Sean Walker"
  :license "MIT"
  :dependencies ["https://github.com/joy-framework/tester"]
  :url "https://github.com/joy-framework/moondown"
  :repo "git+https://github.com/joy-framework/moondown")


(declare-native
  :name "moondown"
  :source @["moondown.c" "buffer.c" "markdown.c" "autolink.c" "html.c" "houdini_href_e.c" "houdini_html_e.c" "stack.c"])
