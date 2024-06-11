module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Events exposing (onClick)
import Html exposing (Html)
import Style.Animation as Anim
import Style.Animation exposing (Animation, State)
import Time exposing (Time)


-- MODEL

type alias Model =
    { menuOpen : Bool
    , animation : State
    }


init : Model
init =
    { menuOpen = False
    , animation = Anim.init
    }


-- MESSAGES

type Msg
    = ToggleMenu
    | Animate State


-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ToggleMenu ->
            let
                newMenuOpen = not model.menuOpen
                animation =
                    if newMenuOpen then
                        Anim.interrupt openAnimation model.animation
                    else
                        Anim.interrupt closeAnimation model.animation
            in
            ( { model | menuOpen = newMenuOpen, animation = animation }, Anim.toMsg Animate animation )

        Animate newState ->
            ( { model | animation = newState }, Cmd.none )


-- ANIMATIONS

openAnimation : Animation
openAnimation =
    Anim.animation
        [ Anim.scale 1.2
        , Anim.rotate 45
        ]
        |> Anim.to
            { duration = 300
            , ease = Anim.easeOutCubic
            }


closeAnimation : Animation
closeAnimation =
    Anim.animation
        [ Anim.scale 1
        , Anim.rotate 0
        ]
        |> Anim.to
            { duration = 300
            , ease = Anim.easeOutCubic
            }


-- VIEW

view : Model -> Html Msg
view model =
    Element.layout [] <|
        Element.column []
            [ Element.el [ onClick ToggleMenu ] (hamburgerIcon model.animation)
            , if model.menuOpen then
                Element.el [] (Element.text "Menu Content")
              else
                Element.none
            ]


hamburgerIcon : State -> Element Msg
hamburgerIcon animation =
    let
        animatedStyle = Anim.style animation
    in
    Element.column [ Element.spacing 5, Element.width (Element.px 30) ]
        [ Element.el [ Element.height (Element.px 4), Element.width (Element.px 30), Element.backgroundColor (rgb 0.2 0.2 0.2), animatedStyle ] Element.none
        , Element.el [ Element.height (Element.px 4), Element.width (Element.px 30), Element.backgroundColor (rgb 0.2 0.2 0.2), animatedStyle ] Element.none
        , Element.el [ Element.height (Element.px 4), Element.width (Element.px 30), Element.backgroundColor (rgb 0.2 0.2 0.2), animatedStyle ] Element.none
        ]


-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }
