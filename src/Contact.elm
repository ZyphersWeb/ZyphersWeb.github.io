module Contact exposing (view, Msg)

import Html exposing (Html, div, h2, p, label, input, button, text)
import Html.Attributes exposing (placeholder, type_)
import Html.Events exposing (onClick)


type Msg
    = Submit


view : Html Msg
view =
    div []
        [ h2 [] [ text "Contact" ]
        , p [] [ text "Feel free to reach out to me!" ]
        , label [] [ text "Your Name:" ]
        , input [ placeholder "Name" ] []
        , label [] [ text "Your Email:" ]
        , input [ type_ "email", placeholder "Email" ] []
        , label [] [ text "Your Message:" ]
        , input [ placeholder "Message" ] []
        , button [ onClick Submit ] [ text "Send" ]
        ]
