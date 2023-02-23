from PySide2 import QtCore, QtGui, QtWidgets
from PySide2.QtCore import Qt
from PySide2.QtCore import QRect
from PySide2.QtWidgets import QMessageBox, QDesktopWidget, QCheckBox
from SQL_functions import *
import pymysql
import os
from search_genius import web_browser_fetch

class Ui_Lyrics(QtWidgets.QWidget):

    switch_window = QtCore.Signal(dict)
    url = ''

    def setupUi(self, Lyrics, url):
        Lyrics.setObjectName("Lyrics")
        Lyrics.resize(800, 600)
        Lyrics.setMinimumSize(QtCore.QSize(800, 600))
        Lyrics.setMaximumSize(QtCore.QSize(800, 600))
        self.Lyrics_field = QtWidgets.QTextEdit(Lyrics)
        self.Lyrics_field.setGeometry(QtCore.QRect(10, 10, 771, 551))
        self.Lyrics_field.setObjectName("Lyrics_field")
        self.Lyrics_field.setReadOnly(True)
        self.Return_to_results = QtWidgets.QPushButton(Lyrics)
        self.Return_to_results.setGeometry(QtCore.QRect(10, 560, 771, 34))
        self.Return_to_results.setObjectName("Return_to_results")

        self.retranslateUi(Lyrics)
        self.url = url
        self.load_lyrics_from_url()
        self.location_on_the_screen()
        QtCore.QMetaObject.connectSlotsByName(Lyrics)

        self.Return_to_results.clicked.connect(self.return_to_res)

    def load_lyrics_from_url(self):
        print(self.url)
        web_browser_fetch(self.url, 0)
        data = ''.join(open(os.path.abspath('./index.txt'), encoding="utf-8").readlines())
        self.Lyrics_field.setText(data)
    
    def location_on_the_screen(self):
        ag = QDesktopWidget().availableGeometry()
        widget = self.geometry()
        x = int(ag.width()/2 - widget.width()/2)
        y = int(ag.height()/2 - widget.height()/2)
        self.move(x, y)

    def return_to_res(self):
        self.switch_window.emit(dict())

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
