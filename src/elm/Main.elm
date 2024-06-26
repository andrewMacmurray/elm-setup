module Main exposing (Flags, Model, Msg, main)

import Browser exposing (Document)
import Html exposing (Html, p, text)



-- Program


main : Program Flags Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- Model


type alias Flags =
    ()


type alias Model =
    {}


type Msg
    = NoOp



-- Init


init : Flags -> ( Model, Cmd Msg )
init _ =
    ( {}, Cmd.none )



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- View


view : Model -> Document Msg
view _ =
    { title = "App"
    , body = [ hello ]
    }


hello : Html msg
hello =
    p [] [ text "hello" ]
