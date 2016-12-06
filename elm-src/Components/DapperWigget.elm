port module DapperWigget exposing (..)

import Html.App
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Debug exposing (log)

import Shared.TpTypes exposing (..)

-- port for sending strings out to JavaScript
port check : String -> Cmd msg

-- port for receiving stuff from JavaScript
port toelm : (String -> msg) -> Sub msg


view : TpFlags -> Html TpMsg
view model =
    div []
        [ button [ onClick AddToText ] [ text "-" ]
        , text model.phrase
        , button [ onClick SendToJavaScript ] [ text "+" ]
        ]



update : TpMsg -> TpFlags -> ( TpFlags, Cmd TpMsg )
update msg model =
    case msg of

        ReceiveFromJavaScript string ->
            log ("here: " ++ string)
            ( model, Cmd.none )

        SendToJavaScript ->
            ( model, check model.phrase )

        AddToText ->
            ( {model | phrase = model.phrase ++ "-"}, Cmd.none )




init : TpFlags -> ( TpFlags, Cmd TpMsg )
init flags =
    ( flags, Cmd.none )



subscriptions : TpFlags -> Sub TpMsg
subscriptions model =
  toelm ReceiveFromJavaScript



-- MAIN


main : Program TpFlags
main =
    Html.App.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
