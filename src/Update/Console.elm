module Update.Console exposing (update)

import Model.Console as Console exposing (Msg(..), Model)
import Navigation exposing (back, load)
import String exposing (trim)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)

        InputCmd str ->
            ( { model | input_cmd = str }, Cmd.none )

        ExecCmd ->
            case trim model.input_cmd of
                "pwd" ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ execed_pwd ++ ( "" :: [] ), input_cmd = "" }, Cmd.none )

                "ls" ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ execed_ls ++ ( "" :: [] ), input_cmd = "" }, Cmd.none )

                "cd" ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, load "http://kokeshing.com" )

                "cd twitter(priv.)" ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, load "https://twitter.com/kokeshing_" )

                "cd twitter(univ.)" ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, load "https://twitter.com/chrysaor1126" )

                "cd github" ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, load "https://github.com/kokeshing" )

                "exit" ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, back 1 )

                "" ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, Cmd.none )

                _ ->
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( ( "No command '" ++ model.input_cmd ++ "' found" ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, Cmd.none )


execed_pwd = ( "http://kokeshing.com" :: [] )

execed_ls = ( " github twitter(priv.) twitter(univ.) about_me.txt" :: [] )