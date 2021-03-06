module Model exposing (Msg(..), Model, init)

import Model.Welcome as Welcome
import Model.Console as Console


type Msg
    = WelcomeMsg Welcome.Msg
    | ConsoleMsg Console.Msg


type alias Model =
    { welcomeModel : Welcome.Model
    , consoleModel : Console.Model
    }

init : Model
init =
    { welcomeModel = Welcome.init
    , consoleModel = Console.init
    }