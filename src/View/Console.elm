module View.Console exposing (view)

import Html exposing (Html, text, div, h1, img, p, br, form, input)
import Html.Attributes exposing (src, name, id, class, value, placeholder)
import Html.Events exposing (onSubmit, onInput)
import Model.Console exposing (Msg(..), Model)


view : Model -> Html Msg
view model =
    div []
    [ output model.exec_log
    , form [ onSubmit ExecCmd ]
        [ p []
            [ text "> "
            , input [ onInput InputCmd, value model.input_cmd, class "console" ] []
            ]
        ]
    ]

output : List String -> Html msg
output log =
    log
        |> List.map (\s -> String.append "> " s)
        |> List.map text
        |> List.intersperse (br [] [])
        |> p []
