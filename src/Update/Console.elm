module Update.Console exposing (update)

import Model.Console as Console exposing (Msg(..), Model)
import Navigation exposing (back, load)
import Char
import String exposing (trim)
import Parser exposing (Parser, (|.), (|=), succeed, symbol, float, keep, ignore, zeroOrMore, oneOrMore, repeat, delayedCommit)


type alias ExecCommand =
    { cmd : String
    , arg : String
    }

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            (model, Cmd.none)

        InputCmd str ->
            ( { model | input_cmd = str }, Cmd.none )

        ExecCmd ->
            let
                getcmd = parse_input_cmd model.input_cmd
                getopt = parse_input_opt model.input_cmd
            in
                case getcmd.cmd of
                    "cd" ->
                        case getcmd.arg of
                            "" ->
                                ( { model | exec_log = model.exec_log ++ ( done_input model.input_cmd ), input_cmd = "" }, load "http://kokeshing.com" )

                            "github" ->
                                ( { model | exec_log = model.exec_log ++ ( done_input model.input_cmd ), input_cmd = "" }, load "https://github.com/kokeshing" )

                            "twitter(priv.)" ->
                                ( { model | exec_log = model.exec_log ++ ( done_input model.input_cmd ), input_cmd = "" }, load "https://twitter.com/kokeshing_" )

                            "twitter(univ.)" ->
                                ( { model | exec_log = model.exec_log ++ ( done_input model.input_cmd ), input_cmd = "" }, load "https://twitter.com/chrysaor1126" )

                            _ ->
                                ( { model | exec_log = model.exec_log ++ ( ( done_input model.input_cmd ) ++ execed_pwd ), input_cmd = "" }, Cmd.none )

                    "ls" ->
                        ( { model | exec_log = model.exec_log ++ ( ( done_input model.input_cmd ) ++ execed_ls ), input_cmd = "" }, Cmd.none )

                    "pwd" ->
                        ( { model | exec_log = model.exec_log ++ ( ( done_input model.input_cmd ) ++ execed_pwd ), input_cmd = "" }, Cmd.none )

                    _ ->
                        ( { model | exec_log = model.exec_log ++ ( ( done_input model.input_cmd ) ++ execed_pwd ), input_cmd = "" }, Cmd.none )


done_input : String -> List String
done_input exec_cmd =
    [ ( "guest@kokeshing.com:/ $ " ++ exec_cmd ) ]

execed_pwd : List String
execed_pwd = [ "http://kokeshing.com", "" ]

execed_ls : List String
execed_ls = [ "github twitter(priv.) twitter(univ.) about_me.txt", "" ]

{- shell command parser -}
spaces : Parser ()
spaces =
    ignore zeroOrMore (\c -> c == ' ')

parse_input_cmd : String -> ExecCommand
parse_input_cmd str =
    case Parser.run getCmd str of
        Ok command ->
            command

        Err parserError ->
            ExecCommand "__ERROR__" ""

parse_input_opt : String -> ( List String )
parse_input_opt str =
    case Parser.run getOpt str of
        Ok opt ->
            opt

        Err parserError ->
            [ "__ERROR__" ]

option : Parser String
option =
      delayedCommit spaces <|
        succeed identity
            |. spaces
            |. symbol "-"
            |= keep oneOrMore Char.isLower

getCmd : Parser ExecCommand
getCmd =
    delayedCommit spaces <|
        succeed ExecCommand
            |= keep oneOrMore Char.isLower
            |. repeat zeroOrMore option
            |. spaces
            |= keep zeroOrMore Char.isLower
            |. repeat zeroOrMore option

getOpt : Parser (List String)
getOpt =
    delayedCommit spaces <|
        succeed (++)
            |. keep oneOrMore Char.isLower
            |= repeat zeroOrMore option
            |. spaces
            |. keep zeroOrMore Char.isLower
            |= repeat zeroOrMore option
