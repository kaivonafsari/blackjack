class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<%= rankName %> of <%= suitName %>'

  initialize: ->
    @model.on 'flip', @render, @
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
    @$el.mouseenter (=> @$el.animate {top: '-10px'})
    @$el.mouseleave (=> @$el.animate {top: '0px'})

