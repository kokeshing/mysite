module View.Welcome exposing (view)

import Html exposing (Html, text, div, h1, img, p, br, form, input, a)
import Html.Attributes exposing (src, name, id, class, value, placeholder, href)
import Html.Events exposing (onSubmit, onInput)
import Model.Welcome exposing (Msg(..), Model)


view : Model -> Html Msg
view model =
    p []
    [ text "Welcome to kokeshing.com 18.06.14 LTS (B.S./InfoSciEng 2.5.2-1057-uec x86_64)"
    , br [] []
    , br [] []
    , text "* Documentation: ", a [ href "http://kokeshing.com"] [ text "http://kokeshing.com" ]
    , br [] []
    , text "* Management: ", a [ href "mailto:kou7cdb1a+site@gmail"] [ text "kou7cdb1a@gmail.com" ]
    , br [] []
    , text "* Support: ", a [ href "mailto:kou7cdb1a+site@gmail"] [ text "kou7cdb1a@gmail.com" ]
    , br [] []
    , br [] []
    , text "0 packages can be updated."
    , br [] []
    , text "0 update is a security update."
    , br [] []
    , br [] []
    , text "Last login: Fri Jun  8 03:30:27 2018 from 153.230.0.162"
    , br [] []
    ]



