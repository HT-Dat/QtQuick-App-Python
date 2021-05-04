import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    implicitWidth: 250
    implicitHeight: 60
    //CUSTOM PROPERTIES
    property url btnIconSource: "../../images/svg_images/home_icon.svg"
    property color btnColorDefault: "#21242c"
    property color btnColorMouseOver: "#343a45"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
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
    }
    contentItem: Item {
        anchors.fill: parent
        id: content
        Image {
            id: iconBtn
            source: btnIconSource
            anchors.leftMargin: 26
            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconWidth
            height: iconHeight
            anchors.verticalCenter: parent.verticalCenter
            width: iconHeight
            fillMode: Image.PreserveAspectFit
            antialiasing: true
        }
        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            anchors.leftMargin: 26
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }
    }
}




/*##^##
Designer {
    D{i:0;formeditorZoom:1.1;height:60;width:250}
}
##^##*/
