module Main exposing (main)

import Browser exposing (Document)
import Html exposing (Attribute, Html, p, text)
import Html.Attributes exposing (attribute)



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


type alias Model =
    {}


type Msg
    = NoOp


type alias Flags =
    ()



-- Init


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initialModel flags, Cmd.none )


initialModel : Flags -> Model
initialModel flags =
    {}



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- View


view : Model -> Document Msg
view model =
    { title = "App"
    , body = [ hello ]
    }


hello : Html msg
hello =
    p [ label "hello" ] [ text "hello" ]


label : String -> Attribute msg
label =
    attribute "data-label"
