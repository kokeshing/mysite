module Update.Welcome exposing (update)

import Model.Welcome as Welcome exposing (Msg(..), Model)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateDatetime datetime ->
            ( { model | now_date = Just datetime }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )