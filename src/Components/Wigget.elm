module Wigget exposing (..)

import Html.App
import Html exposing (Html, div, text)


type Msg
    = NoOp


type alias Model =
    String


view : Model -> Html Msg
view model =
    div []
        [ text model ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )


init : ( Model, Cmd Msg )
init =
    ( "Hello, you, guy, redo", Cmd.none )


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