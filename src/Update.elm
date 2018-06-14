module Update exposing (update)

import Model exposing (Msg(..), Model)
import Update.Welcome as Welcome
import Update.Console as Console


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WelcomeMsg subMsg ->
            let
                ( updatedWelcome, welcomeCmd ) =
                    Welcome.update subMsg model.welcomeModel
            in
                ( { model | welcomeModel = updatedWelcome }
                , Cmd.map WelcomeMsg welcomeCmd
                )

        ConsoleMsg subMsg ->
            let
                ( updatedConsole, consoleCmd ) =
                    Console.update subMsg model.consoleModel
            in
                ( { model | consoleModel = updatedConsole }
                , Cmd.map ConsoleMsg consoleCmd
                )