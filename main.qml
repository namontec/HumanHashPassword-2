import QtQuick 2.11
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3
import ru.nmeo.PasswordGenerator 1.0


ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 480
    minimumWidth: 300
    minimumHeight: 300
    title: qsTr("Human Hash Password Generator")

    Material.theme: Material.System

    ToolTip {
        id: toolTip
        visible: false;
        timeout: 2000;
    }

    PasswordGenerator {
        id: passGen
    }

    function showWarning(warningString)
    {
        toolTip.text = warningString;
        toolTip.visible = true;
        console.log(warningString);
    }

    function checkPhrases()
    {
        var isPhrasesEmpty = ((tedMaster.lenght == 0) && (tedConfirm.lenght == 0))
        if (isPhrasesEmpty) {
            showWarning("Empty phrase is insecure");
            return false;
        }
        var isPhrasesEqual = (tedMaster.text == tedConfirm.text)
        if (!isPhrasesEqual) {
            showWarning("Phases are not equal")
            return false;
        }
        return true;
    }

    function onPressedEnter()
    {
        if (checkPhrases()) {
            showWarning("Generate");
            var password = passGen.generatePassword(tedMaster.text, tedWebsite.text);
            tedPassword.text = password;
        }
    }

    function onPressedCtrlEnter()
    {
        if (checkPhrases()) {
            showWarning("Generate and copy");
        }
    }

    function onPressedCopy()
    {

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
