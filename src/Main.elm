module Main exposing (..)

import Browser
import Element exposing (Element, column, el, row, text, padding, centerX, centerY, layout)
import Element.Border as Border
import Element.Background as Background
import Element.Events exposing (onClick)
import Projects
import Contact
import Styles exposing (..)

import Menu 
import Html exposing (Html)
import Animation as Anim exposing (px)
import Animation exposing ( State)
import Time

-- MODEL

type alias Model =
    { currentPage : Page 
    ,  style : Anim.State
    }


type Page
    = Home
    | Projects
    | Contact


init : Model
init =
    { currentPage = Home 
    }


-- UPDATE

type Msg
    = NavigateTo Page
    | ContactMsg Contact.Msg
    | Show
    | Hide
    | Animate Anim.Msg

type alias Styles = 
    { open : List Anim.Property
    , closed : List Anim.Property
    }

styles : Styles
styles = 
    { open = 
        [ Anim.left (px 0.0)
        , Anim.opacity 1.0
        ]
    , closed = 
        [ Anim.left (px -200.0)
        , Anim.opacity 0
        ]
    }

update : Msg -> Model -> Model
update msg model =
    case msg of
        NavigateTo page ->
            { model | currentPage = page }

        ContactMsg contactMsg ->
            -- Handle Contact messages if needed
            model
        Show ->
            ( { model | style =
                    Animation.interrupt[Animation.to styles.open] model.style
              }
            , Cmd.none
            )
        Hide ->
            ( { model | style =
                    Animation.interrupt[Animation.to styles.closed] model.style
              }
            , Cmd.none
            )
        Animate animMsg ->
            ({model | style = Animation.update animMsg model.style}
            , Cmd.none)

-- VIEW

view : Model -> Element Msg
view model =
    column [centerX, paddingMedium]
        [ header
        , menu1.view
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
