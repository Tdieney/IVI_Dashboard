import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0
import QtGraphicalEffects 1.12

Item {
    height: 54 * Style.heightRatio
    width: parent.width

    TopLeftControl {
        anchors.left: parent.left
        anchors.leftMargin: 24 * Style.widthRatio

        anchors.verticalCenter: parent.verticalCenter
    }

    TopMiddleControl {
        anchors.centerIn: parent
    }

    TopRightControl {
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 24 * Style.widthRatio
    }
}
