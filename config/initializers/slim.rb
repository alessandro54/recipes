# frozen_string_literal: true

Slim::Engine.set_options opts: {
  attr_list_delims: { '{' => '}' },
  shortcut: {
    '#' => { attr: 'id' },
    '.' => { attr: 'class' },
    '~' => { tag: 'turbo-stream', attr: 'action' },
    '@' => { tag: 'turbo-frame', attr: 'id' },
    '~>' => { attr: 'target' }
  }
}
