# frozen_string_literal: true

Slim::Engine.set_options shortcut: {
  'c' => { tag: 'container' },
  '#' => { attr: 'id' },
  '.' => { attr: 'class' },
  '~' => { attr: 'data-controller' }
}
