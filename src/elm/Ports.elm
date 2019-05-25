port module Ports exposing
    ( Token
    , User
    , login
    , loginResponse
    )

import Json.Encode as Encode


type alias User =
    { name : String
    , pass : String
    }


type alias Token =
    { token : String
    }


loginResponse : (Result String Token -> msg) -> Sub msg
loginResponse msg =
    Sub.batch
        [ loginSuccess <| msg << Ok
        , loginFailure <| msg << Err
        ]


port login : User -> Cmd msg


port loginSuccess : (Token -> msg) -> Sub msg


port loginFailure : (String -> msg) -> Sub msg
