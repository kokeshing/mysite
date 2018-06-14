module View exposing (view)

import Html exposing (Html, div)
import Model exposing (Msg(..), Model)
import View.Welcome as Welcome
import View.Console as Console


view : Model -> Html Msg
view { welcomeModel, consoleModel } =
    div []
        [ Html.map WelcomeMsg (Welcome.view welcomeModel)
        , Html.map ConsoleMsg (Console.view consoleModel)
        ]