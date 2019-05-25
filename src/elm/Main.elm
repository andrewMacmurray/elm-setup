module Main exposing (main)

import Browser
import Browser.Events
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Events as Events
import Element.Font as Font
import Html exposing (Html)
import Ports



-- Program


main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- Model


type alias Model =
    { window : Window
    , token : Maybe Ports.Token
    }


type Msg
    = WindowSize Int Int
    | Login
    | LoginResponse (Result String Ports.Token)


type alias Flags =
    { window : Window
    }


type alias Window =
    { width : Int
    , height : Int
    }



-- Init


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initialModel flags, Cmd.none )


initialModel : Flags -> Model
initialModel flags =
    { window = flags.window
    , token = Nothing
    }



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WindowSize width height ->
            ( { model | window = Window width height }
            , Cmd.none
            )

        Login ->
            ( model
            , Ports.login { name = "user", pass = "password" }
            )

        LoginResponse (Ok token) ->
            ( { model | token = Just token }
            , Cmd.none
            )

        LoginResponse (Err errMsg) ->
            ( model
            , Cmd.none
            )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Browser.Events.onResize WindowSize
        , Ports.loginResponse LoginResponse
        ]



-- View


view : Model -> Html Msg
view model =
    layout [ Font.family [ Font.sansSerif ] ] <| mainLayout model


mainLayout model =
    case model.token of
        Just token ->
            row
                [ width fill
                , height <| px model.window.height
                ]
                [ row
                    [ centerX
                    , centerY
                    , Background.color blue
                    , Border.rounded 30
                    , padding 50
                    , Font.color white
                    ]
                    [ text <| "whoop " ++ token.token ]
                ]

        Nothing ->
            row
                [ width fill
                , height <| px model.window.height
                ]
                [ login ]


login =
    column
        [ centerX
        , centerY
        , moveUp 30
        , width (fill |> maximum 500)
        , Background.color blue
        , Border.rounded 10
        ]
        [ el
            [ Font.color white
            , Font.size 30
            , Font.letterSpacing 10
            , centerX
            , padding 100
            , pointer
            ]
            title
        , row [ width fill ]
            [ column
                [ width <| fillPortion 1
                , Background.color darkBlue
                , roundBottomLeft 10
                , Font.color white
                , pointer
                , padding 30
                , mouseOver [ alpha 0.5 ]
                ]
                [ el [ centerX ] <| text "Signup" ]
            , column
                [ width <| fillPortion 2
                , Background.color lightBlue
                , roundBottomRight 10
                , pointer
                , padding 30
                , mouseOver [ alpha 0.5 ]
                , Events.onClick Login
                ]
                [ el [ centerX ] <| text "Login" ]
            ]
        ]


title =
    let
        caption =
            below <|
                el
                    [ centerX
                    , Font.size 10
                    , moveDown 20
                    , alpha 0
                    , pointer
                    , mouseOver [ alpha 1 ]
                    ]
                    (text "I LOVE BREAD!!")
    in
    el [ caption ] <| text "OPRAH"


roundBottomLeft n =
    Border.roundEach
        { topLeft = 0
        , topRight = 0
        , bottomLeft = n
        , bottomRight = 0
        }


roundBottomRight n =
    Border.roundEach
        { topLeft = 0
        , topRight = 0
        , bottomLeft = 0
        , bottomRight = n
        }


blue =
    rgb255 74 123 201


darkBlue =
    rgb255 12 45 97


lightBlue =
    rgb255 87 150 255


white =
    rgb255 255 255 255


black =
    rgb255 0 0 0
