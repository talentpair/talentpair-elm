module Stuff.Update exposing (..)

import Stuff.Messages exposing (Msg(..))
import Stuff.Models exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )