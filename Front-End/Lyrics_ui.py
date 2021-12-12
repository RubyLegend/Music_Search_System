from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import Qt
from SQL_functions import *
import pymysql


class Ui_Lyrics(QtWidgets.QWidget):

    switch_window = QtCore.pyqtSignal()

    def setupUi(self, Lyrics):
        Lyrics.setObjectName("Lyrics")
        Lyrics.resize(800, 600)
        self.Lyrics_field = QtWidgets.QTextEdit(Lyrics)
        self.Lyrics_field.setGeometry(QtCore.QRect(10, 10, 771, 551))
        self.Lyrics_field.setObjectName("Lyrics_field")
        self.Return_to_results = QtWidgets.QPushButton(Lyrics)
        self.Return_to_results.setGeometry(QtCore.QRect(10, 560, 771, 34))
        self.Return_to_results.setObjectName("Return_to_results")

        self.retranslateUi(Lyrics)
        QtCore.QMetaObject.connectSlotsByName(Lyrics)

    def retranslateUi(self, Lyrics):
        _translate = QtCore.QCoreApplication.translate
        Lyrics.setWindowTitle(_translate("Lyrics", "Music Search System | Lyrics"))
        self.Return_to_results.setText(_translate("Lyrics", "Return to results"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Lyrics = QtWidgets.QWidget()
    ui = Ui_Lyrics()
    ui.setupUi(Lyrics)
    Lyrics.show()
    sys.exit(app.exec_())
