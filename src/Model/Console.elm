module Model.Console exposing (Msg(..), Model, init)

type Msg
    = NoOp
    | InputCmd String
    | ExecCmd

type alias Model =
    { input_cmd : String
    , exec_log : List String
    }


init : Model
init =
    { input_cmd = ""
    , exec_log = []
    }