*alert!*

moondown has been archived!

check out https://github.com/pyrmont/markable instead

# moondown

Render markdown as html with janet

## Install

Add to your `project.janet` file

```clojure
{:dependencies [{:repo "https://github.com/joy-framework/moondown" :tag "0.2.0"}]}
```

## Use

```clojure
(import moondown)

(= "<h1>Title</h1>\n" (moondown/render "# Title"))
```

And that's it!
