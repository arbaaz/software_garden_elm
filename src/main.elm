module Main exposing (main)

import Browser
import Browser.Events
import Dict
import Element
import Svg
import Svg.Attributes


dot age color rotation =
    Svg.circle
        [ Svg.Attributes.r (String.fromFloat age)
        , Svg.Attributes.cx "0"
        , Svg.Attributes.cy "0"
        , Svg.Attributes.transform ("rotate(" ++ String.fromFloat rotation ++ ") translate(" ++ String.fromFloat (age * 10) ++ ")")
        , Svg.Attributes.fill color
        ]
        []


line age color rotation =
    Svg.line
        [ Svg.Attributes.strokeWidth (String.fromFloat age)
        , Svg.Attributes.x1 "0"
        , Svg.Attributes.y1 "0"
        , Svg.Attributes.x2 (String.fromFloat (age * 10))
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


segment age { color, rotation } =
    if age <= 0 then
        Svg.g [] []

    else
        Svg.g []
            [ rules
                |> Dict.get color
                |> Maybe.withDefault []
                |> List.map (segment (age - 1))
                |> Svg.g
                    [ Svg.Attributes.transform
                        (String.concat
                            [ "rotate("
                            , String.fromFloat rotation
                            , ") translate("
                            , String.fromFloat (age * 10)
                            , ")"
                            ]
                        )
                    ]
            , dot age color rotation
            , line age color rotation
            ]


main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init () =
    ( 0, Cmd.none )


update duration age =
    ( duration
        |> Debug.log "Duration"
        |> (+) age
        |> Debug.log "Age"
    , Cmd.none
    )


subscriptions age =
    Browser.Events.onAnimationFrameDelta identity


rules =
    Dict.empty
        |> Dict.insert "brown"
            [ { color = "brown", rotation = 0 }
            , { color = "green", rotation = 20 }
            , { color = "green", rotation = -30 }
            ]
        |> Dict.insert "green"
            [ { color = "red", rotation = -45 }
            , { color = "red", rotation = -5 }
            , { color = "red", rotation = 50 }
            ]


view age =
    [ segment (age / 500) { color = "brown", rotation = -90 } ]
        |> Svg.svg
            [ Svg.Attributes.style "background: pink"
            , Svg.Attributes.height "100%"
            , Svg.Attributes.width "100%"
            , Svg.Attributes.viewBox "-500 -500 1000 1000"
            ]
        |> Element.html
        |> Element.layout [ Element.width Element.fill, Element.height Element.fill ]
