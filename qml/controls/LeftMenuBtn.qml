import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    text: qsTr("Left Menu Text")
    implicitWidth: 250
    implicitHeight: 60
    //CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/home_icon.svg"
    property color btnColorDefault: "#21242c"
    property color btnColorMouseOver: "#343a45"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColor: "#55aaff"
    property color activeMenuColorRight: "#2c313c"
    property bool isActiveMenu: false
    property color iconColor: "#ffffff"
    QtObject{
        id: internal
        // Mouse over and click change color
        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }

    }

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
        Rectangle{
            anchors{
                top: parent.top
                bottom: parent.bottom
                left: parent.left

            }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }
        Rectangle{
            anchors{
                top: parent.top
                bottom: parent.bottom
                right: parent.right

            }
            color: activeMenuColorRight
            width: 5
            visible: isActiveMenu
        }
    }
    contentItem: Item {
        anchors.fill: parent
        id: content
        Image {
            id: iconBtn
            y: 21
            source: btnIconSource
            anchors.leftMargin: 26
            sourceSize.width: iconWidth
            sourceSize.height: iconWidth
            height: iconHeight
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            width: iconHeight
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }
        ColorOverlay{
            y: 34
            source: iconBtn
            anchors.leftMargin: 26
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }
        Text {
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
            text: btnLeftMenu.text
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2;height:60;width:250}D{i:6}D{i:7}
}
##^##*/
