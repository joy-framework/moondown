#include <janet.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "markdown.h"
#include "html.h"
#include "buffer.h"

#define OUTPUT_UNIT 64

static Janet c_render(int32_t argc, Janet *argv) {
  janet_fixarity(argc, 1);

  struct buf *ob;

  struct sd_callbacks callbacks;
  struct html_renderopt options;
  struct sd_markdown *markdown;

  const uint8_t *str = janet_getstring(argv, 0);
  const size_t str_len = janet_string_length(str);

  ob = bufnew(OUTPUT_UNIT);

  sdhtml_renderer(&callbacks, &options, (1 << 9));
  markdown = sd_markdown_new(0, 16, &callbacks, &options);

  sd_markdown_render(ob, str, str_len, markdown);
  sd_markdown_free(markdown);

  Janet output = janet_stringv(ob->data, ob->size);

  bufrelease(ob);

  return output;
}

static const JanetReg cfuns[] = {
  {"render", c_render, "(render \"markdown string\")\nRenders a string of markdown as html"},
  {NULL, NULL, NULL}
};

JANET_MODULE_ENTRY(JanetTable *env) {
  janet_cfuns(env, "c_render", cfuns);
}
