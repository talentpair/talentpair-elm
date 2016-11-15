port module DapperWigget exposing (..)

import Html.App
import Html exposing (Html, div, text, button)
import Html.Events exposing (onClick)
import Debug exposing (log)


type Msg
    = AddToText
    | SendToJavaScript
    | ReceiveFromJavaScript String


type alias Flags =
  { phrase : String
  }


-- port for sending strings out to JavaScript
port check : String -> Cmd msg

-- port for receiving stuff from JavaScript
port toelm : (String -> msg) -> Sub msg


view : Flags -> Html Msg
view model =
    div []
        [ button [ onClick AddToText ] [ text "-" ]
        , text model.phrase
        , button [ onClick SendToJavaScript ] [ text "+" ]
        ]



update : Msg -> Flags -> ( Flags, Cmd Msg )
update msg model =
    case msg of

        ReceiveFromJavaScript string ->
            log ("here: " ++ string)
            ( model, Cmd.none )

        SendToJavaScript ->
            ( model, check model.phrase )

        AddToText ->
            ( {model | phrase = model.phrase ++ "-"}, Cmd.none )




init : Flags -> ( Flags, Cmd Msg )
init flags =
    ( flags, Cmd.none )



subscriptions : Flags -> Sub Msg
subscriptions model =
  toelm ReceiveFromJavaScript



-- MAIN


main : Program Flags
main =
    Html.App.programWithFlags
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
