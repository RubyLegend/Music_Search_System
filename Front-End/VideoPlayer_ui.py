#!/usr/bin/env python3

from PySide2 import QtCore, QtGui, QtWidgets
from PySide2.QtCore import Qt, QRect, QUrl, QTimer
from PySide2.QtWidgets import QMessageBox, QDesktopWidget, QApplication, QPushButton, QSizePolicy, QSlider, QStyle, QWidget, QLabel, QHBoxLayout, QVBoxLayout, QComboBox, QFrame, QSpacerItem, QSizePolicy, QTextEdit, QLineEdit, QStackedLayout, QScrollBar
from SQL_functions import *
import youtube_dl
import vlc
import platform
import re

class Ui_VideoPlayer(QWidget):
    
    switch_window = QtCore.Signal(dict)

    url = ''
    login = ''
    window_settings = ''
    comments_opened = False

    def setupUi(self, VideoPlayer, url, login):
        self.window_settings = VideoPlayer
        self.url = url
        self.login = login
        print(self.login)
        options = {
                # Additional options goes here (for youtube_dl)
                #'format': 'bestvideo+bestaudio'
        }
        with youtube_dl.YoutubeDL(options) as ytdl:
            self.videoInfo = ytdl.extract_info(url, download=False)
            
        VideoPlayer.setObjectName("VideoPlayer")
        VideoPlayer.resize(800,600)
        VideoPlayer.setMinimumSize(QtCore.QSize(800,600))
        VideoPlayer.setMaximumSize(QtCore.QSize(800,600))

        self.vlcInstance = vlc.Instance()
        self.vlcInstance.log_unset()
        self.mediaPlayer = self.vlcInstance.media_player_new()
        self.audioPlayer = self.vlcInstance.media_player_new()

        self.videoframe = QFrame()

        self.palette = self.videoframe.palette()
        self.palette.setColor(QtGui.QPalette.Window, QtGui.QColor(0, 0, 0))
        self.videoframe.setPalette(self.palette)
        self.videoframe.setAutoFillBackground(True)

        self.playButton = QPushButton()
        self.playButton.setEnabled(True)
        self.playButton.setIcon(self.style().standardIcon(QStyle.SP_MediaPlay))
        self.playButton.clicked.connect(self.play)

        self.mediaPositionSlider = QSlider(Qt.Horizontal)
        self.mediaPositionSlider.setMaximum(1000)
        self.mediaPositionSlider.sliderMoved.connect(self.setMediaPosition)

        self.qualitySelector = QComboBox()
        self.qualitySelector.addItems(self.getQualities())
        self.qualitySelector.currentTextChanged.connect(self.changeQuality)

        self.audioSelector = QComboBox()
        self.audioSelector.addItems(self.getAudio())
        self.audioSelector.currentTextChanged.connect(self.changeAudio)

        self.returnButton = QPushButton()
        self.returnButton.setEnabled(True)
        self.returnButton.setIcon(self.style().standardIcon(QStyle.SP_ArrowBack))
        self.returnButton.clicked.connect(self.return_to_details)

        self.spacer = QSpacerItem(500, 25, QSizePolicy.Expanding)

        self.commentsButton = QPushButton()
        self.commentsButton.setEnabled(True)
        self.commentsButton.setIcon(self.style().standardIcon(QStyle.SP_MessageBoxInformation))
        self.commentsButton.clicked.connect(self.toggle_layout)

        self.comments = QTextEdit()
        self.comments.setMinimumWidth(205)
        self.comments.setMaximumWidth(205)
        self.comments.setReadOnly(True)
        self.load_comments()

        self.write_comment = QLineEdit()
        self.write_comment.setMinimumWidth(170)
        self.write_comment.setMaximumWidth(170)
        self.write_comment.returnPressed.connect(self.send_comment)
        self.write_comment.setMaxLength(2000)

        self.send_comment_button = QPushButton()
        self.send_comment_button.setMinimumWidth(30)
        self.send_comment_button.setMaximumWidth(30)
        self.send_comment_button.setIcon(self.style().standardIcon(QStyle.SP_ArrowRight))
        self.send_comment_button.clicked.connect(self.send_comment)

        controlLayout = QHBoxLayout()
        controlLayout.setContentsMargins(0, 0, 0, 0)
        controlLayout.addWidget(self.playButton)
        controlLayout.addWidget(self.mediaPositionSlider)
        controlLayout.addWidget(self.qualitySelector)
        controlLayout.addWidget(self.audioSelector)
    
        actionsLayout = QHBoxLayout()
        actionsLayout.setContentsMargins(0,0,0,0)
        actionsLayout.addWidget(self.returnButton)
        actionsLayout.addSpacerItem(self.spacer)
        actionsLayout.addWidget(self.commentsButton)

        layout_without_comments = QVBoxLayout()
        layout_without_comments.addLayout(actionsLayout)
        layout_without_comments.addWidget(self.videoframe)
        layout_without_comments.addLayout(controlLayout)

        send_comment_layout = QHBoxLayout()
        send_comment_layout.addWidget(self.write_comment)
        send_comment_layout.addWidget(self.send_comment_button)

        self.commentsLayout = QVBoxLayout()
        self.commentsLayout.addWidget(self.comments)
        self.commentsLayout.addLayout(send_comment_layout)

        self.layout = QHBoxLayout()
        self.layout.addLayout(layout_without_comments)

        self.setLayout(self.layout)

        QtCore.QMetaObject.connectSlotsByName(VideoPlayer)

        self.timer = QTimer()
        self.timer.setInterval(100)
        self.timer.timeout.connect(self.update_ui)

        self.timer_comments = QTimer()
        self.timer_comments.setInterval(5000)
        self.timer_comments.timeout.connect(self.load_comments)
        self.timer_comments.start()

        self.setMediaContent()
    
    def location_on_the_screen(self):
        ag = QDesktopWidget().availableGeometry()
        widget = self.geometry()
        x = int(ag.width()/2 - widget.width()/2)
        y = int(ag.height()/2 - widget.height()/2)
        self.move(x, y)

    def retranslateUi(self):
        pass

    def return_to_details(self):
        self.mediaPlayer.stop()
        self.mediaPlayer.get_media().release()
        self.mediaPlayer.release()
        self.audioPlayer.stop()
        self.audioPlayer.get_media().release()
        self.audioPlayer.release()
        self.mediaPlayer.get_instance().release()
        self.switch_window.emit(dict())

    def load_comments(self):
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='YAELfvk5Jgt8qRTc',
                                     database='Music_Search_System',
                                     charset='utf8mb4',
                                     cursorclass=pymysql.cursors.DictCursor)
        result = ''
        with connection:
            result = select_where_sort(connection, "YT_Comments.ID, Nickname, Message", "YT_Comments join Users on ID_User = Users.ID join YT_Videos on ID_Video = YT_Videos.ID", "YT_Videos.URL like %s and Removed is false", (self.url), "YT_Comments.ID", "desc")

        
        comments = ''
        for comment in result:
            comments = comments + comment['Nickname'] + '\n> ' + comment['Message'] + "\n\n"

        self.comments.setText(comments)

    def send_comment(self):
        message = self.write_comment.text()
        
        if(len(message) != 0):
            connection = pymysql.connect(host='localhost',
                                         user='root',
                                         password='YAELfvk5Jgt8qRTc',
                                         database='Music_Search_System',
                                         charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)
            with connection:
               it = int(select(connection, 'count(*)', "YT_Comments")[0]['count(*)']) + 1
               video_id = int(select_where(connection, "ID", "YT_Videos", "URL like %s", (self.url))[0]["ID"])
               user_id = int(select_where(connection, "ID", "Users", "Nickname like %s", (self.login))[0]["ID"])
               insert(connection,"YT_Comments", "(%s, %s, %s, %s, %s)", (it, video_id, user_id, message, False))
               connection.commit()
    
            self.load_comments()
            self.write_comment.setText("")


    def toggle_layout(self):
        if(self.comments_opened == False):
            self.window_settings.setMinimumSize(QtCore.QSize(1000,600))
            self.window_settings.setMaximumSize(QtCore.QSize(1000,600))
            self.window_settings.resize(1000, 600)
            self.layout.addLayout(self.commentsLayout)
            self.comments_opened = True
        else:
            self.window_settings.setMinimumSize(QtCore.QSize(800,600))
            self.window_settings.setMaximumSize(QtCore.QSize(800,600))
            self.window_settings.resize(800, 600)
            self.commentsLayout.setParent(None)
            self.comments.setParent(None)
            self.write_comment.setParent(None)
            self.send_comment_button.setParent(None)
            self.comments_opened = False

    def getQualities(self):
        formats = []
        for i in range(len(self.videoInfo['formats'])):
            if re.match("none", self.videoInfo['formats'][i]['acodec']):
                #print(self.videoInfo['formats'][i]['format'], '(', self.videoInfo['formats'][i]['vcodec'], ')')
                formats.append(self.videoInfo['formats'][i]['format'] + ' (' + self.videoInfo['formats'][i]['vcodec']+ ')')

        return formats

    def getAudio(self):
        formats = []
        for i in range(len(self.videoInfo['formats'])):
            if re.match("none", self.videoInfo['formats'][i]['acodec']):
                break;
            formats.append(self.videoInfo['formats'][i]['format'] + ' (' + self.videoInfo['formats'][i]['acodec']+ ')')

        return formats

    def changeQuality(self):
        was_playing = False
        position = self.mediaPositionSlider.value() / 1000.0
        
        if self.audioPlayer.get_position() > position:
            position = self.audioPlayer.get_position()
  
        if self.mediaPlayer.is_playing():
            was_playing = True
            self.play()

        for i in range(len(self.videoInfo['formats'])):
            if self.qualitySelector.currentText() == self.videoInfo['formats'][i]['format'] + ' (' + self.videoInfo['formats'][i]['vcodec'] + ')':
                video = self.videoInfo['formats'][i]['url']
                media = self.vlcInstance.media_new(video)
                media.get_mrl()
                self.mediaPlayer.set_media(media)
                media.parse()
                break

        if was_playing:
            self.play()
        self.setMediaPosition(position * 1000.0)

    def changeAudio(self):
        was_playing = False
        position = self.mediaPositionSlider.value() / 1000.0
        
        if self.audioPlayer.get_position() > position:
            position = self.audioPlayer.get_position()
  
        if self.mediaPlayer.is_playing():
            was_playing = True
            self.play()

        for i in range(len(self.videoInfo['formats'])):
            if self.audioSelector.currentText() == self.videoInfo['formats'][i]['format'] + ' (' + self.videoInfo['formats'][i]['acodec'] + ')':
                audio = self.videoInfo['formats'][i]['url']
                audiofile = self.vlcInstance.media_new(audio)
                audiofile.get_mrl()
                self.audioPlayer.set_media(audiofile)
                audiofile.parse()
                break

        if was_playing:
            self.play()
        self.setMediaPosition(position * 1000.0)

    def setMediaContent(self):
        non_video_records = 0
        for i in range(len(self.videoInfo['formats'])):
            if re.match("none", self.videoInfo['formats'][i]['acodec']):
                break
            non_video_records = non_video_records + 1

        video = self.videoInfo['formats'][non_video_records + self.qualitySelector.currentIndex()]['url']
        audio = self.videoInfo['formats'][0]['url']
        
        media = self.vlcInstance.media_new(video)
        media.get_mrl()

        audiofile = self.vlcInstance.media_new(audio)
        audiofile.get_mrl()

        self.mediaPlayer.set_media(media)
        self.audioPlayer.set_media(audiofile)
        audiofile.parse()
        media.parse()

        # The media player has to be 'connected' to the QFrame (otherwise the
        # video would be displayed in it's own window). This is platform
        # specific, so we must give the ID of the QFrame (or similar object) to
        # vlc. Different platforms have different functions for this
        if platform.system() == "Linux": # for Linux using the X Server
            self.mediaPlayer.set_xwindow(int(self.videoframe.winId()))
        elif platform.system() == "Windows": # for Windows
            self.mediaPlayer.set_hwnd(int(self.videoframe.winId()))
        elif platform.system() == "Darwin": # for MacOS
            self.mediaPlayer.set_nsobject(int(self.videoframe.winId()))

    def play(self):
        if self.mediaPlayer.is_playing():
            self.mediaPlayer.pause()
            self.audioPlayer.pause()
            self.timer.stop()
        else:
            self.mediaPlayer.play()
            while not self.mediaPlayer.is_playing():
                pass    
            self.audioPlayer.play()
            self.timer.start()
        self.update_ui()

    def setMediaPosition(self, position):
        self.timer.stop()
        self.mediaPlayer.set_position(position / 1000.0)
        self.audioPlayer.set_position(position / 1000.0)
        self.timer.start()

    def update_ui(self):
        position = int(self.mediaPlayer.get_position() * 1000.0)
        self.mediaPositionSlider.setValue(position)

        if self.mediaPlayer.is_playing():
            self.playButton.setIcon(
                self.style().standardIcon(QStyle.SP_MediaPause))
        else:
            self.playButton.setIcon(
                self.style().standardIcon(QStyle.SP_MediaPlay))

        # Resync video and audio in case of some glitches
        if self.mediaPlayer.get_position() - self.audioPlayer.get_position() > 0.005:
            # Will sync audio to video position
            self.audioPlayer.set_position(self.mediaPlayer.get_position())
        if self.audioPlayer.get_position() - self.mediaPlayer.get_position() > 0.005:
            # Will sync video to audio position
            self.mediaPlayer.set_position(self.audioPlayer.get_position())

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    VideoPlayer = Ui_VideoPlayer()
    VideoPlayer.setupUi(VideoPlayer, "http://www.youtube.com/watch?v=NewMQgLA3rQ", "RubyLegend")
    VideoPlayer.show()
    sys.exit(app.exec_())
