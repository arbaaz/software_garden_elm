module Main exposing (main)

import Element
import Svg
import Svg.Attributes


main =
    [ Svg.circle
        [ Svg.Attributes.r "10"
        , Svg.Attributes.cx "0"
        , Svg.Attributes.cy "0"
        , Svg.Attributes.transform "translate(80)"
        , Svg.Attributes.fill "skyblue"
        ]
        []
    , Svg.circle
        [ Svg.Attributes.r "10"
        , Svg.Attributes.cx "0"
        , Svg.Attributes.cy "0"
        , Svg.Attributes.fill "orange"
        , Svg.Attributes.transform "rotate(72) translate(80)"
        ]
        []
    , Svg.circle
        [ Svg.Attributes.r "10"
        , Svg.Attributes.cx "0"
        , Svg.Attributes.cy "0"
        , Svg.Attributes.fill "red"
        , Svg.Attributes.transform "rotate(144) translate(80)"
        ]
        []
    , Svg.circle
        [ Svg.Attributes.r "10"
        , Svg.Attributes.cx "00"
        , Svg.Attributes.cy "0"
        , Svg.Attributes.fill "lime"
        , Svg.Attributes.transform "rotate(216) translate(80)"
        ]
        []
    , Svg.circle
        [ Svg.Attributes.r "10"
        , Svg.Attributes.cx "0"
        , Svg.Attributes.cy "0"
        , Svg.Attributes.fill "maroon"
        , Svg.Attributes.transform "rotate(288) translate(80)"
        ]
        []
    ]
        |> Svg.svg
            [ Svg.Attributes.style "background: pink"
            , Svg.Attributes.height "100%"
            , Svg.Attributes.width "100%"
            , Svg.Attributes.viewBox "-300 -300 600 600"
            ]
        |> Element.html
        |> Element.layout [ Element.width Element.fill, Element.height Element.fill ]
