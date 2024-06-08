module Projects exposing (view)

import Element exposing (Element, column, el, text)
import Styles exposing (textHeader, textBody)


view : Element msg
view =
    column []
        [ textHeader (text "Projects")
        , column []
            [ textBody (text "Project 1: Description of project 1.")
            , textBody (text "Project 2: Description of project 2.")
            , textBody (text "Project 3: Description of project 3.")
            ]
        ]
