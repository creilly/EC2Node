div '.row', ->
  div '.span9.column', -> div '.hero-unit', ->
      h1 ->
        'Cat Mat!'
      div -> button '#send-button.btn.primary.large', -> 'Cat Shuffle'
      div '#kitten', ->
        h2 -> 'Cat Matting'
        img '.kitten-image', src: 'http://placekitten.com/200/300',
  div '.span7.column', -> div '.hero-unit', ->
      h1 ->
        'Cat Chat'
      div '#chatter.form-stacked', ->
        input '#text-input', type: 'text', name: 'text-input',
        input '#text-submit.btn.large', type: 'submit',
      div '#cat-chat', ->
