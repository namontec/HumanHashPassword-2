import QtQuick 2.11
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Universal 2.0
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Human Hash Password Generator 2.0")

    Material.theme: Material.Dark



    Column {
        id: column
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        spacing: 15
        anchors.fill: parent


        Label {
            id: text1
            text: qsTr("Master phrase")
        }

        TextField {
            id: textField
            text: qsTr("")
            anchors.left: parent.left
            anchors.right: parent.right
            placeholderText: "enter master phrase"
        }

        Label {
            id: text2
            text: qsTr("Text")
        }

        TextField {
            id: textField1
            text: qsTr("Text Field")
            anchors.left: parent.left
            anchors.right: parent.right
        }

        RowLayout {
            id: rowLayout
            height: 100
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Button {
                id: btnGenerate
                text: qsTr("Generate")
                Layout.fillWidth: true

            }
            Button {
                id: btnCopy
                text: qsTr("Copy")
                Layout.fillWidth: true

            }

            Button {
                id: btnGenCopy
                text: qsTr("Generate and copy")
                Layout.fillWidth: true

            }

        }


    }
}
