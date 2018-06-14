module Model.Welcome exposing (Msg(..), Model, init)

import Date exposing (Date)
import Task

type Msg
    = NoOp
    | UpdateDatetime Date


type alias Model =
    { now_date : Maybe Date
    }


init : ( Model, Cmd Msg )
init =
    { now_date = Nothing
    }
     ! [ getCurrentDate ]


getCurrentDate : Cmd Msg
getCurrentDate =
    let
        handleResult result =
            case result of
                Ok datetime ->
                    UpdateDatetime datetime

                Err _ ->
                    NoOp
    in
        Task.attempt handleResult Date.now