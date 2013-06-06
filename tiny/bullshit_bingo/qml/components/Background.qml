
import QtQuick 1.0

Rectangle 
{
    color: "black"

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#000000" }
        GradientStop { position: 0.5; color: "yellow" }
        GradientStop { position: 1.0; color: "#404040" }
    }
}
