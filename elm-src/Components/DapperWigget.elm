port module DapperWigget exposing (..)

import Html.App
import Stuff.Messages exposing (Msg)
import Stuff.Models exposing (Model)
import Stuff.View exposing (view)
import Stuff.Update exposing (update)

type alias Flags =
  { phrase : String
  }

init : Flags -> ( Model, Cmd Msg )
init flags =
    ( flags.phrase, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program { phrase : String }
main =
    Html.App.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }