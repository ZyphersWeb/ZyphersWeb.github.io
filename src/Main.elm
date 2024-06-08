module Main exposing (..)

import Browser
import Element exposing (Element, column, el, row, text, centerX, padding)
import Element.Background as Background
import Element.Border as Border
import Element.Events exposing (onClick)
import Element.Font as Font
import Projects
import Contact
import Html exposing (Html)


-- MODEL

type alias Model =
    { currentPage : Page }


type Page
    = Home
    | Projects
    | Contact


init : Model
init =
    { currentPage = Home }


-- UPDATE

type Msg
    = NavigateTo Page
    | ContactMsg Contact.Msg


update : Msg -> Model -> Model
update msg model =
    case msg of
        NavigateTo page ->
            { model | currentPage = page }

        ContactMsg contactMsg ->
            -- Handle Contact messages if needed
            model


-- VIEW

view : Model -> Element Msg
view model =
    column []
        [ header
        , case model.currentPage of
            Home ->
                homeView

            Projects ->
                Projects.view

            Contact ->
                Element.map ContactMsg Contact.view
        ]


header : Element Msg
header =
    el [ Background.color (rgb255 248 248 248), padding 20, centerX ]
        (column []
            [ el [] (text "My Portfolio")
            , row []
                [ button "Home" Home
                , button "Projects" Projects
                , button "Contact" Contact
                ]
            ]
        )


button : String -> Page -> Element Msg
button label page =
    el [ padding 10, Border.rounded 5, Background.color (rgb255 200 200 200), centerX, onClick (NavigateTo page) ]
        (text label)


homeView : Element Msg
homeView =
    column []
        [ el [] (text "Welcome to My Portfolio!")
        , el [] (text "Explore my projects and feel free to get in touch.")
        ]


-- MAIN

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = Element.layout [] << view
        }


rgb255 : Int -> Int -> Int -> Element.Color
rgb255 r g b =
    Element.rgb (toFloat r / 255) (toFloat g / 255) (toFloat b / 255)
