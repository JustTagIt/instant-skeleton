
require! {
  moment
}

ticker = # keep dates up-to-date
  component-did-mount: ->
    @int = set-interval (~> if @is-mounted! then @force-update!), 1000ms * 60s
  component-will-unmount: ->
    clear-interval @int

# TodoList
module.exports = component \ActiveDate ticker, ({cursor, title}:props) ->
  date = cursor.deref!
  [calendar, from-now] =
    [moment(date, \x).calendar!,
     moment(date, \x).from-now!]

  DOM.span {title:calendar} "#title #from-now"
