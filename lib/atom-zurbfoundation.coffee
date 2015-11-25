AtomZurbfoundationView = require './atom-zurbfoundation-view'
{CompositeDisposable} = require 'atom'

module.exports = AtomZurbfoundation =
  atomZurbfoundationView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @atomZurbfoundationView = new AtomZurbfoundationView(state.atomZurbfoundationViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @atomZurbfoundationView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'atom-zurbfoundation:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @atomZurbfoundationView.destroy()

  serialize: ->
    atomZurbfoundationViewState: @atomZurbfoundationView.serialize()

  toggle: ->
    console.log 'Atom Zurb Foundation was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
