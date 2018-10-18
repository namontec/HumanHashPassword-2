import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

ColumnLayout {
    id: column
    property string name: "ProgressTimer"
    property int startValue
    property alias value: progressBar.value
    property alias interval: timer.interval
    property alias to: progressBar.to

    signal timerStop()

    Layout.fillWidth: true



    ProgressBar {
        id: progressBar
        Layout.fillWidth: true
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


    function startTimer() {
        progressBar.value = startValue
        timer.start()
    }

    function restartTimer() {
        progressBar.value = startValue
        timer.restart()
    }

    function stopTimer() {
        timer.stop();
        timerStop();
    }

    function pauseTimer() {
        timer.stop();
    }

}
