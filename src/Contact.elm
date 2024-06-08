module Contact exposing (view, Msg)

import Element exposing (Element, column, el, text, padding)
import Element.Events exposing (onClick)
import Styles exposing (..)


type Msg
    = Submit


view : Element Msg
view =
    column []
        [ textHeader (text "Contact")
        , textBody (text "Feel free to reach out to me!")
        , labeledInput "Your Name:" "Name"
        , labeledInput "Your Email:" "Email"
        , labeledInput "Your Message:" "Message"
        , buttonStyle "Send" Submit
        ]


labeledInput : String -> String -> Element msg
labeledInput label placeholder =
    column []
        [ textSubHeader (text label)
        , el [ backgroundColorLight, paddingSmall, borderRounded ] (text placeholder)
        ]
