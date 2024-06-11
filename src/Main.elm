module Main exposing (..)

import Browser
import Element exposing (Element, column, el, row, text, padding, centerX, centerY, layout)
import Element.Border as Border
import Element.Background as Background
import Element.Events exposing (onClick)
import Projects
import Contact
import Styles exposing (..)


-- MODEL

type alias Model =
    { currentPage : Page 
    -- , menuOpen    : Bool
    -- , animation   : State
    }


type Page
    = Home
    | Projects
    | Contact


init : Model
init =
    { currentPage = Home 
    -- , menuOpen    = False
    -- , animation   = Anim.init
    }


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
    column [centerX, paddingMedium]
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
    el headerStyle
        (column []
            [ textHeader (text "My Portfolio")
            , row []
                [ buttonStyle "Home" (NavigateTo Home)
                , buttonStyle "Projects" (NavigateTo Projects)
                , buttonStyle "Contact" (NavigateTo Contact)
                ]
            ]
        )


homeView : Element Msg
homeView =
    column []
        [ textHeader (text "Welcome to My Portfolio!")
        , textBody (text "Explore my projects and feel free to get in touch.")
        ]


-- MAIN

main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , update = update
        , view = Element.layout [] << view
        }
