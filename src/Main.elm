module Main exposing (main)

import Html exposing (program)
import Model exposing (Msg, Model, init)
import Update exposing (update)
import View exposing (view)


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        }