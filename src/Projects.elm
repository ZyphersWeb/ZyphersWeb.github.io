module Projects exposing (view)

import Html exposing (Html, div, h2, ul, li, text)


view : Html msg
view =
    div []
        [ h2 [] [ text "Projects" ]
        , ul []
            [ li [] [ text "Project 1: Description of project 1." ]
            , li [] [ text "Project 2: Description of project 2." ]
            , li [] [ text "Project 3: Description of project 3." ]
            ]
        ]
