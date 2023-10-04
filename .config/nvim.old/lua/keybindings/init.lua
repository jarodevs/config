vim.g.tagbar_type_tf = {
  ctagstype = 'tf',
  kinds = {
    'r:Resource',
    'R:Resource',
    'd:Data',
    'D:Data',
    'v:Variable',
    'V:Variable',
    'p:Provider',
    'P:Provider',
    'm:Module',
    'M:Module',
    'o:Output',
    'O:Output',
    'f:TFVar',
    'F:TFVar'
  }
 }

require('keybindings.autopairs')
require('keybindings.coc')
require('keybindings.nvim-tree')
require('keybindings.telescope')
require('keybindings.floaterm')
require('keybindings.tagbar')
require('keybindings.ctrlp')
