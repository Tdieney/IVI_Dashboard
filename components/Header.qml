import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0
import QtGraphicalEffects 1.12
import "qrc:/LayoutManager.js" as Responsive

Item {
    height: 54 * adaptive.getHeightRatio()
    width: parent.width

    property var adaptive: new Responsive.AdaptiveLayoutManager(1920 , 1200, parent.width, parent.height)

    // Component.onCompleted: {
    //     console.log("height:", parent.height)
    //     console.log("width:", parent.width)
    // }

    TopLeftControl {
        anchors.left: parent.left
        anchors.leftMargin: 24 * adaptive.getWidthRatio()

        anchors.verticalCenter: parent.verticalCenter
    }

    TopMiddleControl {
        anchors.centerIn: parent
    }

    TopRightControl {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 24 * adaptive.getWidthRatio()
    }
}
