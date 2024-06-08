module Styles exposing (..)

import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Events as Events


-- COLORS

rgb255 : Int -> Int -> Int -> Color
rgb255 r g b =
    Element.rgb (toFloat r / 255) (toFloat g / 255) (toFloat b / 255)


-- GENERAL STYLES

backgroundColorLight : Attribute msg
backgroundColorLight =
    Background.color (rgb255 248 248 248)


backgroundColorMedium : Attribute msg
backgroundColorMedium =
    Background.color (rgb255 200 200 200)


backgroundColorDark : Attribute msg
backgroundColorDark =
    Background.color (rgb255 150 150 150)


paddingSmall : Attribute msg
paddingSmall =
    padding 10


paddingMedium : Attribute msg
paddingMedium =
    padding 20


borderRounded : Attribute msg
borderRounded =
    Border.rounded 5


textHeader : Element msg -> Element msg
textHeader content =
    el [ Font.size 32, Font.bold ] content


textSubHeader : Element msg -> Element msg
textSubHeader content =
    el [ Font.size 24, Font.bold ] content


textBody : Element msg -> Element msg
textBody content =
    el [ Font.size 16 ] content


buttonStyle : String -> msg -> Element msg
buttonStyle label msg =
    el
        [ paddingSmall
        , borderRounded
        , backgroundColorMedium
        , Font.color (rgb255 0 0 0)
        , Border.color (rgb255 100 100 100)
        , Border.width 1
        , Border.solid
        , centered
        , Events.onClick msg
        ]
        (text label)


-- LAYOUT HELPERS

centered : Attribute msg
centered =
    centerX
