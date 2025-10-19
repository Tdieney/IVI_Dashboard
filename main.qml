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
        if(adaptive) {
            adaptive.updateWindowWidth(root.width)
            updateStyleRatios()
        }
    }

    onHeightChanged: {
        if(adaptive) {
            adaptive.updateWindowHeight(root.height)
            updateStyleRatios()
        }
    }

    property var adaptive: new Responsive.AdaptiveLayoutManager(1920 , 1200, root.width, root.height)
    
    // Update Style ratios when window size changes
    Component.onCompleted: updateStyleRatios()
    
    function updateStyleRatios() {
        Style.widthRatio = adaptive.getWidthRatio()
        Style.heightRatio = adaptive.getHeightRatio()
        console.log("Updated Style ratios - Width:", Style.widthRatio, "Height:", Style.heightRatio)
    }
    
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
                anchors.verticalCenterOffset: - 350 * Style.heightRatio
                anchors.horizontalCenterOffset: 37 * Style.widthRatio
                scale: 0.35 + 0.5 * Style.heightRatio
            }

            Icon {
                icon.source: Style.getPowerIconBasedOnTheme()
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: - 77 * Style.heightRatio
                anchors.horizontalCenterOffset: 550 * Style.widthRatio
                scale: 0.35 + 0.5 * Style.heightRatio
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

    TopLeftButtonIconColumn {
        z: 99
        anchors.left: parent.left
        anchors.top: headerLayout.bottom
        anchors.leftMargin: 18 * Style.widthRatio
    }

    RowLayout {
        id: mapLayout
        visible: Style.mapAreaVisible
        spacing: 0
        anchors.fill: parent
        Item {
            Layout.preferredWidth: 580 * Style.widthRatio
            Layout.fillHeight: true
            Image {
                id: sidebarImage
                anchors.centerIn: parent
                source: Style.getSidebarIconBasedOnTheme()
                scale: Style.heightRatio
            }
        }

        NavigationMapHelperScreen {
            Layout.fillWidth: true
            Layout.fillHeight: true
            runMenuAnimation: true
        }
    }

    LaunchPadControl {
        id: launcher
        y: (root.height - height) / 2 + (footerLayout.height)
        x: (root.width - width ) / 2
    }
}
