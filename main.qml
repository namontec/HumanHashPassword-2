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
    minimumHeight: mainColumn.height + mainColumn.anchors.margins
    title: "Human Hash Password Generator"

    //Material.theme: Material.System

    ToolTip {
        id: toolTip
        parent: activeFocusItem
        visible: false;
        timeout: 2000;
    }

    PasswordGenerator {
        id: passGen
    }

    function showWarning(warningString)
    {
        toolTip.text = warningString;
        toolTip.timeout = 2000;
        toolTip.visible = true;
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

    function generate()
    {
        if (checkPhrases()) {
            var password = passGen.generatePassword(tedMaster.text, tedWebsite.text);
            tedPassword.text = password;
        }
    }

    function generateCopy()
    {
        if (checkPhrases()) {
            var password = passGen.generatePassword(tedMaster.text, tedWebsite.text);

            tedPassword.text = "<Copied to clipboard>";
        }
    }

    function copy()
    {

    }

    Column {
        id: mainColumn
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 15
        //spacing: 0


        TextLineEdit {
            id: tedMaster
            caption: "Master phrase:"
            placeholder: "11 symbols or more"
            echoMode: TextInput.Password
            onPressedEnter: generate()
            onPressedCtrlEnter: generateCopy()

        }

        TextLineEdit {
            id: tedConfirm
            caption: "Confirm master phrase:"
            echoMode: TextInput.Password
            onPressedEnter: generate()
            onPressedCtrlEnter: generateCopy()
        }

        TextLineEdit {
            id: tedWebsite
            caption: "Web Site:"
            onPressedEnter: generate()
            onPressedCtrlEnter: generateCopy()
        }

        TextLineEdit {
            id: tedPassword
            caption: "Password:"
        }


        ProgressTimer {
            id: progressTimer
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
                onPressed: pressedEnter()
            }
            Button {
                id: btnCopy
                text: qsTr("Copy")
                Layout.fillWidth: true
                onPressed: pressedCopy()
            }

            Button {
                id: btnGenCopy
                text: qsTr("Generate and copy")
                Layout.fillWidth: true
                onPressed: pressedCtrlEnter()
            }

        }



    }
}
