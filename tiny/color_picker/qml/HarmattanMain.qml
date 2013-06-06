import QtQuick 1.0
import com.nokia.meego 1.0

PageStackWindow {
    initialPage: mainPage
    showStatusBar: false

    Page{
        id: mainPage
        orientationLock: PageOrientation.LockPortrait
        Main {
            id: main
            anchors.fill: parent
        }
    }
}
