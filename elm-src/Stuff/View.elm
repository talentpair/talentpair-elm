module Stuff.View exposing (..)

import Html exposing (Html, div, text)
import Stuff.Messages exposing (Msg)
import Stuff.Models exposing (Model)


view : Model -> Html Msg
view model =
    div []
        [ text model ]