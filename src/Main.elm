module Main exposing (..)

import Browser
import Html exposing (Html, div, h1, nav, a, text, p)
import Html.Attributes exposing (class, href)
import Html.Events exposing (onClick)
import Projects
import Contact


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

view : Model -> Html Msg
view model =
    div []
        [ header
        , case model.currentPage of
            Home ->
                homeView

            Projects ->
                Projects.view

            Contact ->
                Html.map ContactMsg Contact.view
        ]


header : Html Msg
header =
    div [ class "header" ]
        [ h1 [] [ text "My Portfolio" ]
        , nav []
            [ a [ href "#", onClick (NavigateTo Home) ] [ text "Home" ]
            , a [ href "#", onClick (NavigateTo Projects) ] [ text "Projects" ]
            , a [ href "#", onClick (NavigateTo Contact) ] [ text "Contact" ]
            ]
        ]


homeView : Html Msg
homeView =
    div []
        [ h1 [] [ text "Welcome to My Portfolio!" ]
        , p [] [ text "Explore my projects and feel free to get in touch." ]
        ]


-- MAIN

main =
    Browser.sandbox { init = init, update = update, view = view }
