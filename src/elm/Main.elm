module Main exposing (main)

import Browser
import Browser.Events
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html exposing (Html)



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
    }


type Msg
    = WindowSize Int Int


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
    }



-- Update


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WindowSize width height ->
            ( { model | window = Window width height }
            , Cmd.none
            )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions model =
    Browser.Events.onResize WindowSize



-- View


view : Model -> Html Msg
view model =
    layout [ Font.family [ Font.sansSerif ] ] <| mainLayout model.window


mainLayout window =
    row
        [ width fill
        , height <| px window.height
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
                ]
                [ el [ centerX ] <| text "Login" ]
            ]
        ]


title =
    let
        caption =
            below <| el [ centerX, Font.size 10, moveDown 20 ] <| text "I LOVE BREAD!!"
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
