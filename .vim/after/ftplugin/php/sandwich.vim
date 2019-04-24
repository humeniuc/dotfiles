if &compatible || exists('b:did_sandwich_php_ftplugin') || get(g:, 'sandwich_no_php_ftplugin', 0)
  finish
endif

scriptencoding utf-8
if !exists('s:local_recipes')
  let s:local_recipes = [
        \   {'__filetype__': 'tex', 'buns': ['“', '”'],    'nesting': 1, 'input': [ 'p"' ], 'filetype': ['php']},
        \   {'__filetype__': 'tex', 'buns': ['<?= htmlspecialchars(''', ''') ?>'],    'nesting': 1, 'input': [ 'p=' ], 'filetype': ['php']},
        \   {'__filetype__': 'tex', 'buns': ['<?= h(''', ''') ?>'],    'nesting': 1, 'input': [ 'p-' ], 'filetype': ['php']},
        \ ]
endif
call sandwich#util#insertlocal(s:local_recipes)

