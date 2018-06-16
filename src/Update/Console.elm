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
            if trim model.input_cmd == "pwd" then
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ execed_pwd ++ ( "" :: [] ), input_cmd = "" }, Cmd.none )

            else if  trim model.input_cmd == "ls" then
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ execed_ls ++ ( "" :: [] ), input_cmd = "" }, Cmd.none )

            else if  trim model.input_cmd == "cd " then
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, load "http://kokeshing.com" )

            else if  trim model.input_cmd == "cd twitter(priv.)" then
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, load "https://twitter.com/kokeshing_" )

            else if  trim model.input_cmd == "cd twitter(univ.)" then
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, load "https://twitter.com/chrysaor1126" )

            else if  trim model.input_cmd == "cd github" then
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, load "https://github.com/kokeshing" )

            else if  trim model.input_cmd == "exit" then
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, back 1 )

            else if  trim model.input_cmd == "" then
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, Cmd.none )

            else
                    ( { model | exec_log = model.exec_log ++ ( ( "guest@kokeshing.com:/ $ " ++ model.input_cmd ) :: [] ) ++ ( ( "No command '" ++ model.input_cmd ++ "' found" ) :: [] ) ++ ( "" :: [] ), input_cmd = "" }, Cmd.none )


execed_pwd : List String
execed_pwd = ( "http://kokeshing.com" :: [] )

execed_ls : List String
execed_ls = ( " github twitter(priv.) twitter(univ.) about_me.txt" :: [] )