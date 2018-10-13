import QtQuick 2.11
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    property string name: "TextLineEdit"
    property alias echoMode: textField.echoMode
    property alias caption: textLabel.text
    property alias placeholder: textField.placeholderText
    property alias lenght: textField.length
    property alias text: textField.text
    property int clearTimer: -1

    anchors.right: parent.right
    anchors.left: parent.left

    height: textLabel.height + textField.height

    signal pressedEnter()
    signal pressedCtrlEnter()
    signal fieldChanged()

    Column {
        id: tedColumn
        anchors.fill: parent

        Label {
            id: textLabel
            text: qsTr("Enter")
        }

        RowLayout {
            anchors.left: parent.left
            anchors.right: parent.right

            TextField {
                id: textField
                text: qsTr("")
                Layout.fillHeight: false
                Layout.fillWidth: true
                onLengthChanged: {
                    passLength.text = textField.length
                    fieldChanged()                   
                }
                Rectangle {
                    color: "yellow"
                    anchors.fill: parent
                    opacity: 1
                    z: -1
                }
            }

            Label {
                id: passLength
                text: "0"

            }

        }

    }

    Keys.onPressed: {
        if (event.key === Qt.Key_Return)
            if (event.modifiers & Qt.ControlModifier)
                pressedCtrlEnter()
            else
                pressedEnter()
    }

}
