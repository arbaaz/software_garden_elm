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


line color rotation =
    Svg.line
        [ Svg.Attributes.strokeWidth "1"
        , Svg.Attributes.x1 "0"
        , Svg.Attributes.y1 "0"
        , Svg.Attributes.x2 "80"
        , Svg.Attributes.y2 "0"
        , Svg.Attributes.stroke color
        , Svg.Attributes.transform
            (String.concat
                [ "rotate("
                , String.fromFloat rotation
                , ")"
                ]
            )
        ]
        []


segment color rotation children =
    Svg.g
        []
        [ Svg.g
            [ Svg.Attributes.transform
                (String.concat
                    [ "rotate("
                    , String.fromFloat rotation
                    , ") translate(80)"
                    ]
                )
            ]
            children
        , dot color rotation
        , line color rotation
        ]


main =
    [ segment "skyblue"
        0
        [ segment "red" 15 []
        , segment "blue"
            -15
            [ segment "yellow" 45 []
            , segment "black" -20 []
            , segment "green" -90 []
            ]
        ]
    , segment "orange" 72 []
    , segment "red" 144 []
    , segment "lime" 216 []
    , segment "maroon" 288 []
    ]
        |> Svg.svg
            [ Svg.Attributes.style "background: pink"
            , Svg.Attributes.height "100%"
            , Svg.Attributes.width "100%"
            , Svg.Attributes.viewBox "-500 -500 1000 1000"
            ]
        |> Element.html
        |> Element.layout [ Element.width Element.fill, Element.height Element.fill ]
