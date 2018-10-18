import QtQuick 2.11
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ColumnLayout {
    id: tedColumn
    property string name: "TextLineEdit"
    property alias echoMode: textField.echoMode
    property alias caption: textLabel.text
    property alias placeholder: textField.placeholderText
    property alias lenght: textField.length
    property alias text: textField.text
    property int clearTimer: -1

    //anchors.right: parent.right
    //anchors.left: parent.left
    Layout.fillWidth: true

    Layout.preferredHeight: textLabel.height + textField.height
    //height: textLabel.height + textField.height

    signal pressedEnter()
    signal pressedCtrlEnter()
    signal fieldChanged()


    //anchors.fill: parent
    //Layout.fillWidth: true


    Label {
        id: textLabel
        text: qsTr("Enter")
    }

    RowLayout {
        //anchors.left: parent.left
        //anchors.right: parent.right
        Layout.fillWidth: true

        TextField {
            id: textField
            text: qsTr("")
            Layout.fillHeight: false
            Layout.fillWidth: true
            inputMethodHints: Qt.ImhNoPredictiveText
            onLengthChanged: {
                passLength.text = textField.length
                if (textField.length != 0) fieldChanged()
            }
        }

        Label {
            id: passLength
            text: "0"

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
