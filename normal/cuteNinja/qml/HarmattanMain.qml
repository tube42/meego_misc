import QtQuick 1.0
import com.nokia.meego 1.0

PageStackWindow {
    initialPage: mainPage
    showStatusBar: false

    Page {
        id: mainPage
        orientationLock: PageOrientation.LockLandscape
        Main {
            id: main
            anchors.fill: parent
        }
    }
    
   Connections {
       target: platformWindow
       onActiveChanged: main.active = platformWindow.active
   }
   
   
}
