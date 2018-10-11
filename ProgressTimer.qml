import QtQuick 2.0
import QtQuick.Controls 2.3

Item {
    property string name: "ProgressTimer"
    property alias value: progressBar.value

    signal timerStop()

    anchors.right: parent.right
    anchors.left: parent.left
    height: progressBar.height

    Column{
        id: column
        anchors.fill: parent

        ProgressBar {
            id: progressBar
            anchors.right: parent.right
            anchors.left: parent.left
            from: 0; to: 60
            value: 60

        }

        Timer {
            id: timer
            interval: 1000
            running: true
            repeat: true
            onTriggered: {
                progressBar.value = progressBar.value - 1;
                if (progressBar.value <= 0) {
                    stopTimer()
                }
            }
        }
    }

    function startTimer() {
        progressBar.value = 100
        timer.start()
    }

    function resetTimer() {

    }

    function stopTimer() {
        timer.stop();
        timerStop();
    }

}
