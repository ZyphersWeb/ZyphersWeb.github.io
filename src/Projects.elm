module Projects exposing (view)

import Element exposing (Element, column, el, text)


view : Element msg
view =
    column []
        [ el [] (text "Projects")
        , column []
            [ el [] (text "Project 1: Description of project 1.")
            , el [] (text "Project 2: Description of project 2.")
            , el [] (text "Project 3: Description of project 3.")
            ]
        ]
