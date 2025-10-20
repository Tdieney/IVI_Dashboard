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

    SwipeView {
        id: swipeView
        anchors.fill: parent

        HomeScreen {
        }

        Setting {
        }
    }

    footer: Footer{
        id: footerLayout
        onLauncherClicked: {
            if (launcher.visible) {
                launcher.close()
            } else {
                launcher.open()
            }
        }

        onSettingClicked: {
            if (swipeView.currentIndex == 0) {
                swipeView.currentIndex = 1
            } else {
                swipeView.currentIndex = 0
            }
        }
    }

    LaunchPadControl {
        id: launcher
        y: (root.height - height) / 2 + (footerLayout.height)
        x: (root.width - width ) / 2
    }
}
