import QtQuick 2.11
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3
import ru.nmeo.PasswordGenerator 1.0
import ru.nmeo.Tools 1.0


ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 100
    minimumWidth: 250
    minimumHeight: mainColumn.height + mainColumn.anchors.margins
    title: "Human Hash Password Generator"
    Material.theme: Material.System

    ToolTip {
        id: toolTip
        parent: activeFocusItem
        visible: false;
        timeout: 2000;
    }

    PasswordGenerator {
        id: passGen
    }

    Tools {
        id: tools
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
            copy(password);
        }
    }

    function copy(string)
    {
        if (string !== "") {
            tools.copyToClipboard(string);
            tedPassword.text = "<Copied to clipboard>";
            passwordTimer.pauseTimer();
        }
        else showWarning("Empty password");
    }

    Column {
        id: mainColumn
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.margins: 15
        spacing: 5

        TextLineEdit {
            id: tedMaster
            caption: "Master phrase:"
            placeholder: "11 symbols or more"
            echoMode: TextInput.Password
            onPressedEnter: generate()
            onPressedCtrlEnter: generateCopy()
            onFieldChanged: phraseTimer.restartTimer()

            ProgressTimer {
                id: phraseTimer
                anchors.bottom: parent.bottom
                opacity: 0.5
                to: 600
                startValue: 600
                onTimerStop: {
                    tedMaster.text  = ""
                    tedConfirm.text = ""
                }
            }
        }




        TextLineEdit {
            id: tedConfirm
            caption: "Confirm master phrase:"
            echoMode: TextInput.Password
            onPressedEnter: generate()
            onPressedCtrlEnter: generateCopy()
            onFieldChanged: phraseTimer.restartTimer()
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
            onFieldChanged: passwordTimer.restartTimer()

            ProgressTimer {
                id: passwordTimer
                anchors.bottom: parent.bottom
                opacity: 0.5
                to: 20
                startValue: 20
                onTimerStop: tedPassword.text = ""
            }
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
                onPressed: generate()
            }
            Button {
                id: btnCopy
                text: qsTr("Copy")
                Layout.fillWidth: true
                onPressed: copy(tedPassword.text)
            }

            Button {
                id: btnGenCopy
                text: qsTr("Generate and copy")
                Layout.fillWidth: true
                onPressed: generateCopy()
            }

        }



    }
}
