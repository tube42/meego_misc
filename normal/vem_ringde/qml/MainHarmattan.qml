
import QtQuick 1.0
import com.meego 1.0

PageStackWindow {
    initialPage: mainPage

    Page{
        id: mainPage
        orientationLock: PageOrientation.LockPortrait
        Main {
            id: main
            anchors.fill: parent
        }
    }


    // detect app minimization in harmattan
    Connections {
         target: platformWindow
//         onViewModeChanged: console.log("** VIEWMODE", platformWindow, platformWindow.viewMode)
//         onVisibleChanged: console.log("** VISIBLE", platformWindow, platformWindow.visible)
//         onActiveChanged: console.log("** ACTIVE", platformWindow, platformWindow.active)
         onActiveChanged: if(!platformWindow.active) main.state = "menu"
     }
}
