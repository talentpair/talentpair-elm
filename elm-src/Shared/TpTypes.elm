module Shared.TpTypes exposing (..)


type TpMsg
    = AddToText
    | SendToJavaScript
    | ReceiveFromJavaScript String

type alias TpFlags =
  { phrase : String
  }
