import QtQuick
import QtQuick.Layouts
import HuskarUI.Basic
import com.flight.db 1.0

ColumnLayout{
    property var search_data:{
        "flight_id":"",
        "departure":"",
        "destination":"",
        "depart_time":""
    }

    Layout.fillWidth: true
    Layout.fillHeight: true
    spacing: 10
    ColumnLayout {
        Layout.fillWidth: true
        //Layout.fillHeight: true
        spacing: 30

        RowLayout {
            id: searchRow
            Layout.preferredHeight: 30
            Layout.maximumHeight: 30
            Layout.alignment: Qt.AlignHCenter
            Layout.fillWidth: true
            Layout.topMargin: 30
            spacing: 30

            HusInput {
                id: search_my_flight_input
                Layout.preferredWidth: 300
                Layout.maximumWidth: 300
                Layout.fillHeight: true
                radiusBg.all: 5
                placeholderText: "输入航班号"
                onTextChanged: search_data.flight_id=text
            }

            HusIconButton {
                id: search_my_flight_button
                Layout.preferredWidth: 75
                Layout.maximumWidth: 75
                Layout.fillHeight: true
                radiusBg.all: 5
                iconSource: HusIcon.SearchOutlined
                text: qsTr("搜索")
                onClicked: {}
            }
        }

        // 第二个RowLayout
        RowLayout {
            id: rectangleRow
            Layout.preferredHeight: 30
            Layout.maximumHeight: 30
            Layout.fillWidth: true

            HusSelect{
                Layout.preferredWidth: 180
                Layout.maximumHeight: 180
                Layout.fillHeight: true
                clearEnabled: false
                model: [
                    {value:"",label:qsTr("起始地")},
                    {value:"北京",label:qsTr("北京")},
                    {value:"上海",label:qsTr("上海")}
                ]
                onActivated: search_data.departure=currentValue
            }
            HusSelect{
                Layout.preferredWidth: 180
                Layout.maximumWidth: 180
                Layout.fillHeight: true
                clearEnabled: false
                model:[
                    {value:"",label:qsTr("目的地")},
                    {value:"北京",label:qsTr("北京")},
                    {value:"上海",label:qsTr("上海")}
                ]
                onActivated: search_data.destination=currentValue
            }
            HusDateTimePicker{
                id:pick
                Layout.preferredWidth: 280
                Layout.maximumWidth: 280
                Layout.fillHeight: true
                placeholderText: qsTr("请选择始发时间")
                format: qsTr("yyyy-MM-dd hh:mm:ss")
                onTextChanged: search_data.depart_time=text
            }
        }
    }
    HusDivider{
        Layout.fillWidth: true
    }
    Item{
        Layout.fillHeight: true
        Layout.fillWidth: true
    }

}
