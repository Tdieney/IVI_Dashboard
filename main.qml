import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.12

import Style 1.0
import "pages"
import "components"
import "qrc:/LayoutManager.js" as Responsive

ApplicationWindow {
    id: root
    width: 1024
    height: 600
    // width: 1920
    // height: 1200
    maximumHeight: height
    minimumHeight: height
    maximumWidth: width
    minimumWidth: width
    visible: true
    title: qsTr("IVI Main Window")

    onWidthChanged: {
        if(adaptive)
            adaptive.updateWindowWidth(root.width)
    }

    onHeightChanged: {
        if(adaptive)
            adaptive.updateWindowHeight(root.height)
    }

    property var adaptive: new Responsive.AdaptiveLayoutManager(1920 , 1200, root.width, root.height)

    FontLoader {
        id: uniTextFont
        source: "qrc:/fonts/Unitext Regular.ttf"
    }

    background: Loader {
        anchors.fill: parent
        sourceComponent: Style.mapAreaVisible ? backgroundRect : backgroundImage
    }

    Component {
        id: backgroundRect
        Rectangle {
            color: "#171717"
            anchors.fill: parent
        }
    }

    Component {
        id: backgroundImage
        Image {
            source: Style.getImageBasedOnTheme()
            Icon {
                icon.source: Style.getLockIconBasedOnTheme()
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 350 * adaptive.getHeightRatio()
                anchors.horizontalCenterOffset: 37 * adaptive.getWidthRatio()
                scale: 0.35 + 0.5 * adaptive.getHeightRatio()
            }

            Icon {
                icon.source: Style.getPowerIconBasedOnTheme()
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 77 * adaptive.getHeightRatio()
                anchors.horizontalCenterOffset: 550 * adaptive.getWidthRatio()
                scale: 0.35 + 0.5 * adaptive.getHeightRatio()
            }
        }
    }

    Header {
        z: 99
        id: headerLayout
    }

    footer: Footer{
        id: footerLayout
        onOpenLauncher: launcher.open()
    }

//    SwipeView {
//        id: swipeView
//        anchors.fill: parent
//        currentIndex: tabBar.currentIndex

//        HomeScreen {
//        }

//        Navigation {
//        }

//        Infotainment {
//        }

//        VehicleInfo {
//        }

//        Setting {
//        }
//    }

//    footer: Rectangle {
//        width: parent.width
//        height: 70
//        color: Qt.rgba(30/255, 30/255, 30/255, 0.85)
//        radius: 24
//        anchors.bottom: parent.bottom
//        z: 10

//        layer.enabled: true


//        TabBar {
//            id: tabBar
//            anchors.fill: parent
//            anchors.margins: 12
//            background: null
//            spacing: 24
//            currentIndex: swipeView.currentIndex

//            TabButton {
//                text: qsTr("Home Screen")
//            }
//            TabButton {
//                text: qsTr("Navigation")
//            }
//            TabButton {
//                text: qsTr("Infotainment")
//            }
//            TabButton {
//                text: qsTr("Vehicle Info")
//            }
//            TabButton {
//                text: qsTr("Settings")
//            }
//        }
//    }
}
