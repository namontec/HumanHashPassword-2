import QtQuick 2.11
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3


ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 480
    minimumWidth: 300
    minimumHeight: 300
    title: qsTr("Human Hash Password Generator")

    Material.theme: Material.System

    function isPhrasesEqual() {
        return (tedMaster.text == tedConfirm.text)
    }

    function isPhraseEmpty() {
        return ((tedMaster.lenght == 0) || (tedConfirm.lenght == 0))
    }

    function onPressedEnter() {

    }

    function onPressedCtrlEnter() {

    }

    function onPressedCopy() {

    }

    Column {
        id: mainColumn
        anchors.margins: 15
        spacing: 5
        anchors.fill: parent


        TextLineEdit {
            id: tedMaster
            caption: "Master phrase:"
            placeholder: "11 symbols or more"
            echoMode: TextInput.Password

        }

        TextLineEdit {
            id: tedConfirm
            caption: "Confirm master phrase:"
            echoMode: TextInput.Password
        }

        TextLineEdit {
            id: tedWebsite
            caption: "Web Site:"
        }

        TextLineEdit {
            id: tedPassword
            caption: "Password:"
        }

        RowLayout {
            id: rowButtons
            height: btnGenerate.height
            anchors.right: parent.right
            anchors.left: parent.left

            Button {
                id: btnGenerate
                text: qsTr("Generate")
                Layout.fillWidth: true
                onPressed: onPressedEnter()
            }
            Button {
                id: btnCopy
                text: qsTr("Copy")
                Layout.fillWidth: true
                onPressed: onPressedCopy()
            }

            Button {
                id: btnGenCopy
                text: qsTr("Generate and copy")
                Layout.fillWidth: true
                onPressed: onPressedCtrlEnter()
            }

        }


    }
}
