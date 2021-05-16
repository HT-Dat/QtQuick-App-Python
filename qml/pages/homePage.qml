import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"
import QtQuick.Layouts 1.0
Item {
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Rectangle {
            id: rectangleTop
            height: 70
            color: "#5c667d"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 50
            anchors.leftMargin: 50
            anchors.topMargin: 40

            GridLayout {
                anchors.fill: parent
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 0
                rows: 1
                columns: 3

                CustomTextField{
                    id: textField
                    placeholderText: "Enter your name"
                    Layout.maximumWidth: 65535
                    Layout.preferredWidth: 400
                    Layout.fillWidth: true
                }

                CustomButton{
                    id: btnChangeName
                    text: "Change name"
                    Layout.maximumWidth: 200
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    Layout.preferredWidth: 250
                    onClicked: backend.welcomeText(textField.text)
                }

                Switch {
                    id: switchHome
                }
            }

        }

        Rectangle {
            id: rectangle2
            color: "#1d2128"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangleTop.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 40
            anchors.topMargin: 10
            anchors.leftMargin: 50
            anchors.rightMargin: 50

            Label {
                id: labelTextName
                x: 51
                color: "#93979a"
                text: qsTr("Welcome")
                anchors.top: parent.top
                clip: false
                font.pointSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20
            }

            Label {
                id: labelDate
                color: "#00ffff"
                text: qsTr("Date")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.topMargin: 59
                font.pointSize: 12
                clip: false
            }

            ScrollView {
                id: scrollView
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: labelDate.bottom
                anchors.bottom: parent.bottom
                clip: true
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                anchors.bottomMargin: 10
                anchors.topMargin: 10
                Text{
                    id: textHome
                    color: "#a9b2c8"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">GNU GENERAL PUBLIC LICENSE</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Version 3, 29 June 2007</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Copyright (c) 2020 <span style=\" font-weight:600;\">Wanderson M. Pimenta</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600; color:#55aaff;\">Attention</span>: this project was created with the Open Souce tools from Qt Company,</p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">this project can be used for studies or personal non-commercial projects. </p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">If you are going to use it for </span><span style=\" font-weight:600; color:#55aaff;\">commercial use</span><span style=\" font-weight:600;\">, you need to purchase a license at &quot;https://www.qt.io&quot;.</span><br/>
領つぱいリ者9記やぴクく市小ミ期実リユト処98陸弁ほずちも元細おもく権号にみほ撮害キノス案東ケラハ千和療うゅ。葉旅験のしクイ関者ヘヌ害輔タ回戦もとめず梨活ヲ庫本リノネ目北ウヤルホ育年式ず八伴ト報作クっぞ知得ょ当手ヒネチト況提歯ねゅ。億ヤワ生画トにほう土供事げごり第火よく真済ねたじ併行じぱひ崎刊ス子5身選ヒム決曜半リユラ間長ゅべ戸存オルフエ子54新3歓曽膨乗つ。<br/>
上メエクイ具同朝市調シ資化リへ知権モウヒ躍止せおぞほ宏新ロト版図ごー変押ぼぜお著投シルオ猛審ヌナ正分ゆどいご将取ょにえス芸4用坂居弘由もあふつ。次英仕<br/>
詳報にねあ毎有ヘヱスヲ載治テマノ下特しつ新催そてゃ広赤7続野タヱナ通打は委周辺字到点まご。週し読宗ちまり画意ぎず海健シ芸号換表ノ緒際治ヲヌヘヤ代日ろ<br/>
小ぽ故芸しごン真負りゅ刊報必ヘヨモ題四ム順9前チワニメ位監介てざあ幼掃ネウ日言文うさ歩氏正抽むちびぴ。検メク海時性リぴぜけ海連5併ヌラトオ<br/>
拡カキケイ戦無そつや断1玉フマ何次モロサ脅任サヘ科部生れずだめ光93本6報面めっ部員じ済発イ基掲賀ス定直おりレみ果舎賛削にて。<br/>
拡カキケイ戦無そつや断1玉フマ何次モロサ脅任サヘ科部生れずだめ光93本6報面めっ部員じ済発イ基掲賀ス定直おりレみ果舎賛削にて。<br/>
拡カキケイ戦無そつや断1玉フマ何次モロサ脅任サヘ科部生れずだめ光93本6報面めっ部員じ済発イ基掲賀ス定直おりレみ果舎賛削にて。<br/>
拡カキケイ戦無そつや断1玉フマ何次モロサ脅任サヘ科部生れずだめ光93本6報面めっ部員じ済発イ基掲賀ス定直おりレみ果舎賛削にて。<br/>
拡カキケイ戦無そつや断1玉フマ何次モロサ脅任サヘ科部生れずだめ光93本6報面めっ部員じ済発イ基掲賀ス定直おりレみ果舎賛削にて。<br/>
拡カキケイ戦無そつや断1玉フマ何次モロサ脅任サヘ科部生れずだめ光93本6報面めっ部員じ済発イ基掲賀ス定直おりレみ果舎賛削にて。<br/>
拡カキケイ戦無そつや断1玉フマ何次モロサ脅任サヘ科部生れずだめ光93本6報面めっ部員じ済発イ基掲賀ス定直おりレみ果舎賛削にて。<br/>
由禁ラみよ査禁きすや出減うず料面フ開過ユネチツ新込載サ塾効選ねクら表労カヱロ騒動全ヤクウレ合故熊でみさ歳禁あし本根然依だスのる。勝せどげふ</p></body></html>"
                    anchors.fill: parent
                    font.pixelSize: 12
                    clip: false
                    textFormat: Text.RichText
                }
            }
        }
    }
    Connections{
        target: backend
        function onSetName(stringText){
            labelTextName.text = stringText
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}
}
##^##*/
