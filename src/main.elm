module Main exposing (main)

import Element
import Svg
import Svg.Attributes


dot color rotation =
    Svg.circle
        [ Svg.Attributes.r "10"
        , Svg.Attributes.cx "0"
        , Svg.Attributes.cy "0"
        , Svg.Attributes.transform ("rotate(" ++ String.fromFloat rotation ++ ") translate(80)")
        , Svg.Attributes.fill color
        ]
        []


main =
    [ dot "skyblue" 0
    , dot "orange" 72
    , dot "red" 144
    , dot "lime" 216
    , dot "maroon" 288
    ]
        |> Svg.svg
            [ Svg.Attributes.style "background: pink"
            , Svg.Attributes.height "100%"
            , Svg.Attributes.width "100%"
            , Svg.Attributes.viewBox "-300 -300 600 600"
            ]
        |> Element.html
        |> Element.layout [ Element.width Element.fill, Element.height Element.fill ]
