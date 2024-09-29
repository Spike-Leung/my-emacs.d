;;; Compiled snippets and support files for `vue-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'vue-mode
                     '(("tv3" "<script setup>\n\n</script>\n\n<template>\n\n</template>\n\n<style scoped lang=\"less\">\n\n</style>\n" "tempate for vue3" nil nil nil "/home/spike/.emacs.d/snippets/vue-mode/vue3-template" nil nil)
                       ("tv2" "<template>\n\n</template>\n<script>\nexport default {\n  data() {\n    return {};\n  }\n};\n</script>\n<style scoped lang=\"less\">\n\n</style>\n" "tempate for vue2" nil nil nil "/home/spike/.emacs.d/snippets/vue-mode/vue2-template" nil nil)
                       ("tb" "{{$t('$0')}}" "tb" nil nil nil "/home/spike/.emacs.d/snippets/vue-mode/translate-in-brace" nil nil)
                       ("tt" "this.$t('$0')" "tt" nil nil nil "/home/spike/.emacs.d/snippets/vue-mode/translate" nil nil)
                       ("t" "$t('$0')" "t" nil nil nil "/home/spike/.emacs.d/snippets/vue-mode/template-translate" nil nil)))


;;; Do not edit! File generated at Sun Sep 29 10:57:20 2024
