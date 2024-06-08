module Contact exposing (view, Msg)

import Element exposing (Element, column, el, text, padding, centerX)
import Element.Events exposing (onClick)
import Element.Border as Border
import Element.Background as Background


type Msg
    = Submit


view : Element Msg
view =
    column []
        [ el [] (text "Contact")
        , el [] (text "Feel free to reach out to me!")
        , labeledInput "Your Name:" "Name"
        , labeledInput "Your Email:" "Email"
        , labeledInput "Your Message:" "Message"
        , el [ padding 10, Border.rounded 5, Background.color (rgb255 200 200 200), centerX, onClick Submit ]
            (text "Send")
        ]


labeledInput : String -> String -> Element msg
labeledInput label placeholder =
    column []
        [ el [] (text label)
        , el [ Background.color (rgb255 245 245 245), padding 10, Border.rounded 5 ] (text placeholder)
        ]


rgb255 : Int -> Int -> Int -> Element.Color
rgb255 r g b =
    Element.rgb (toFloat r / 255) (toFloat g / 255) (toFloat b / 255)
