module Update.Console exposing (update)

import Model.Console as Console exposing (Msg(..), Model)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)

        InputCmd str ->
            ( { model | input_cmd = str }, Cmd.none )

        ExecCmd ->
            ( { model | exec_log = model.exec_log ++ ( model.input_cmd :: [] ), input_cmd = "" }, Cmd.none )