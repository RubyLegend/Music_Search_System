from PySide2 import QtCore, QtGui, QtWidgets
from PySide2.QtCore import Qt
from PySide2.QtCore import QRect
from PySide2.QtWidgets import QMessageBox, QDesktopWidget, QCheckBox
from SQL_functions import *
import pymysql
from selenium import webdriver
import os
import time

class Ui_Details_song(QtWidgets.QWidget):

    res_data = ''
    AlbumName = ''
    switch_window = QtCore.Signal(list)
    switch_window2 = QtCore.Signal(str)
    switch_window3 = QtCore.Signal(str)

    def setupUi(self, Details_song, data):
        Details_song.setObjectName("Details_song")
        Details_song.resize(800, 600)
        Details_song.setMinimumSize(QtCore.QSize(800, 600))
        Details_song.setMaximumSize(QtCore.QSize(800, 600))
        self.verticalLayout = QtWidgets.QVBoxLayout(Details_song)
        self.verticalLayout.setObjectName("verticalLayout")
        self.label_6 = QtWidgets.QLabel(Details_song)
        font = QtGui.QFont()
        font.setPointSize(25)
        self.label_6.setFont(font)
        self.label_6.setAlignment(QtCore.Qt.AlignCenter)
        self.label_6.setObjectName("label_6")
        self.verticalLayout.addWidget(self.label_6)
        self.Song_name = QtWidgets.QLabel(Details_song)
        font = QtGui.QFont()
        font.setPointSize(20)
        self.Song_name.setFont(font)
        self.Song_name.setObjectName("Song_name")
        self.verticalLayout.addWidget(self.Song_name)
        self.Album_name = QtWidgets.QLabel(Details_song)
        font = QtGui.QFont()
        font.setPointSize(20)
        self.Album_name.setFont(font)
        self.Album_name.setObjectName("Album_name")
        self.verticalLayout.addWidget(self.Album_name)
        self.Author_name = QtWidgets.QLabel(Details_song)
        font = QtGui.QFont()
        font.setPointSize(20)
        self.Author_name.setFont(font)
        self.Author_name.setObjectName("Author_name")
        self.Author_name.setWordWrap(True)
        self.verticalLayout.addWidget(self.Author_name)
        self.Lyrics = QtWidgets.QPushButton(Details_song)
        self.Lyrics.setObjectName("Lyrics")
        self.verticalLayout.addWidget(self.Lyrics)
        self.Video = QtWidgets.QPushButton(Details_song)
        self.Video.setObjectName("Video")
        self.verticalLayout.addWidget(self.Video)
        self.Return_to_results = QtWidgets.QPushButton(Details_song)
        self.Return_to_results.setObjectName("Return_to_results")
        self.verticalLayout.addWidget(self.Return_to_results)

        self.res_data = data
        #self.get_album()

        self.retranslateUi(Details_song)
        QtCore.QMetaObject.connectSlotsByName(Details_song)        
        self.location_on_the_screen()

        self.Return_to_results.clicked.connect(self.return_button)
        self.Lyrics.clicked.connect(self.open_lyrics)
        self.Video.clicked.connect(self.playVideo)

        if(self.res_data['Video URL'] == 'None'):
            self.Video.setEnabled(False)


    def return_button(self):
        self.switch_window.emit(list())
    
    def location_on_the_screen(self):
        ag = QDesktopWidget().availableGeometry()
        widget = self.geometry()
        x = int(ag.width()/2 - widget.width()/2)
        y = int(ag.height()/2 - widget.height()/2)
        self.move(x, y)

    def open_lyrics(self):
        self.switch_window2.emit(self.res_data['Lyrics URL'])

    def playVideo(self):
        print("Trying to play video.")
        print("Trying to get video URL:")
        print(self.res_data['Video URL'])
        self.switch_window3.emit(self.res_data['Video URL'])

    def retranslateUi(self, Details_song):
        _translate = QtCore.QCoreApplication.translate
        Details_song.setWindowTitle(_translate("Details_song", "Music Search System | Details"))
        self.label_6.setText(_translate("Details_song", "Details"))
        self.Song_name.setText(_translate("Details_song", "Song name: " + self.res_data['Name']))
        self.Album_name.setText(_translate("Details_song", "Album name: " + self.res_data['Album']))
        self.Author_name.setText(_translate("Details_song", "Author(s) name: " + self.res_data['Artists']))
        self.Lyrics.setText(_translate("Details_song", "-> Click to open lyrics <-"))
        self.Return_to_results.setText(_translate("Details_song", "Return to results"))
        if(self.res_data['Video URL'] != 'None'):
            self.Video.setText(_translate("Details_song", "Open YouTube video in player"))
        else:
            self.Video.setText(_translate("Details_song", "Video not available"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Details_song = QtWidgets.QWidget()
    ui = Ui_Details_song()
    ui.setupUi(Details_song)
    Details_song.show()
    sys.exit(app.exec_())
