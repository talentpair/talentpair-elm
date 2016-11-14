module Widget exposing (..)

import Html.App
import Stuff.Messages exposing (Msg)
import Stuff.Models exposing (Model)
import Stuff.View exposing (view)
import Stuff.Update exposing (update)


init : ( Model, Cmd Msg )
init =
    ( "Hello, you, guy, widget", Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never
main =
    Html.App.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }