import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import Style 1.0

ColumnLayout {
    spacing: 3 * Style.heightRatio
    width: 60 * Style.widthRatio
    height: 280 * Style.heightRatio
    Rectangle {
        color: "transparent"
        Layout.fillWidth: true
        Layout.preferredHeight: 48 * Style.heightRatio
        Icon {
            anchors.centerIn: parent
            icon.source: "qrc:/icons/tell_tale_lamp/Headlight2.svg"
            scale: 0.5 + 0.5 * Style.heightRatio
        }
    }

    Rectangle {
        color: "transparent"
        Layout.fillWidth: true
        Layout.preferredHeight: 48 * Style.heightRatio
        Icon {
            anchors.centerIn: parent
            icon.source: "qrc:/icons/tell_tale_lamp/Property_Default.svg"
            scale: 0.5 + 0.5 * Style.heightRatio
        }
    }

    Rectangle {
        color: "transparent"
        Layout.fillWidth: true
        Layout.preferredHeight: 48 * Style.heightRatio
        Icon {
            anchors.centerIn: parent
            icon.source: "qrc:/icons/tell_tale_lamp/Headlights.svg"
            scale: 0.5 + 0.5 * Style.heightRatio
        }
    }

    Rectangle {
        color: "transparent"
        Layout.fillWidth: true
        Layout.preferredHeight: 48 * Style.heightRatio
        Icon {
            anchors.centerIn: parent
            icon.source: "qrc:/icons/tell_tale_lamp/Seatbelt.svg"
            scale: 0.5 + 0.5 * Style.heightRatio
        }
    }
}
