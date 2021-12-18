from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import QRect
from PyQt5.QtWidgets import QMessageBox, QDesktopWidget, QCheckBox
from SQL_functions import *
from search_genius import *

class Ui_Filters(QtWidgets.QWidget):
    
    switch_window = QtCore.pyqtSignal(list)
    
    def setupUi(self, Filters):
        Filters.setObjectName("Filters")
        Filters.resize(476, 600)
        Filters.setMinimumSize(QtCore.QSize(476, 600))
        Filters.setMaximumSize(QtCore.QSize(476, 600))
        self.label_2 = QtWidgets.QLabel(Filters)
        self.label_2.setGeometry(QtCore.QRect(100, 160, 71, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label_2.setFont(font)
        self.label_2.setObjectName("label_2")
        
        self.Artist = QtWidgets.QLineEdit(Filters)
        self.Artist.setGeometry(QtCore.QRect(180, 110, 251, 32))
        self.Artist.setObjectName("Artist")
        
        self.Album = QtWidgets.QLineEdit(Filters)
        self.Album.setGeometry(QtCore.QRect(180, 160, 251, 32))
        self.Album.setObjectName("Album")
        
        self.Song = QtWidgets.QLineEdit(Filters)
        self.Song.setGeometry(QtCore.QRect(180, 210, 251, 32))
        self.Song.setObjectName("Song")

        self.Release_date_checkBox = QCheckBox(Filters)
        self.Release_date_checkBox.setObjectName(u"Release_date_checkBox")
        self.Release_date_checkBox.setGeometry(QRect(10, 260, 21, 22))

        self.Release_date = QtWidgets.QDateTimeEdit(Filters)
        self.Release_date.setGeometry(QtCore.QRect(180, 260, 251, 32))
        self.Release_date.setObjectName("Release_date")
        self.Release_date.setCalendarPopup(True)

        self.Genre_checkBox = QCheckBox(Filters)
        self.Genre_checkBox.setObjectName(u"Genre_checkBox")
        self.Genre_checkBox.setGeometry(QRect(10, 310, 21, 22))
        
        self.Genre = QtWidgets.QComboBox(Filters)
        self.Genre.setGeometry(QtCore.QRect(180, 310, 251, 32))
        self.Genre.setObjectName("Genre")
        
        self.label = QtWidgets.QLabel(Filters)
        self.label.setGeometry(QtCore.QRect(110, 110, 53, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label.setFont(font)
        self.label.setObjectName("label")
        self.label_3 = QtWidgets.QLabel(Filters)
        self.label_3.setGeometry(QtCore.QRect(110, 210, 53, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label_3.setFont(font)
        self.label_3.setObjectName("label_3")
        self.label_4 = QtWidgets.QLabel(Filters)
        self.label_4.setGeometry(QtCore.QRect(40, 260, 131, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label_4.setFont(font)
        self.label_4.setObjectName("label_4")
        self.label_6 = QtWidgets.QLabel(Filters)
        self.label_6.setGeometry(QtCore.QRect(210, 60, 81, 18))
        font = QtGui.QFont()
        font.setPointSize(18)
        self.label_6.setFont(font)
        self.label_6.setObjectName("label_6")
        
        self.Search = QtWidgets.QPushButton(Filters)
        self.Search.setGeometry(QtCore.QRect(20, 450, 171, 61))
        font = QtGui.QFont()
        font.setPointSize(18)
        self.Search.setFont(font)
        self.Search.setObjectName("Search_Button")
        self.Add = QtWidgets.QPushButton(Filters)
        self.Add.setGeometry(QtCore.QRect(260, 450, 171, 61))
        font = QtGui.QFont()
        font.setPointSize(18)
        self.Add.setFont(font)
        self.Add.setObjectName("Add_Button")
        self.label_5 = QtWidgets.QLabel(Filters)
        self.label_5.setGeometry(QtCore.QRect(102, 310, 61, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label_5.setFont(font)
        self.label_5.setObjectName("label_5")
        self.Release_date.setEnabled(0)
        self.Genre.setEnabled(0)

        self.Release_date_checkBox.stateChanged.connect(self.Release_date.setEnabled)
        self.Genre_checkBox.stateChanged.connect(self.Genre.setEnabled)

        self.location_on_the_screen()

        self.retranslateUi(Filters)
        QtCore.QMetaObject.connectSlotsByName(Filters)

        self.Album.returnPressed.connect(self.search)
        self.Artist.returnPressed.connect(self.search)
        self.Song.returnPressed.connect(self.search)
        self.Search.clicked.connect(self.search)
        self.Add.clicked.connect(self.request)

    def location_on_the_screen(self):
        ag = QDesktopWidget().availableGeometry()
        widget = self.geometry()
        x = round(ag.width()/2 - widget.width()/2)
        y = round(ag.height()/2 - widget.height()/2)
        self.move(x, y)

    def request(self):
        get_lyrics(self.Artist.text(), self.Song.text(), 0, 0, 0, 1, 1)
        buttonReply2 = QMessageBox.about(self, "Successfull", "All search results from Genius added to database")

    def retranslateUi(self, Filters):
        _translate = QtCore.QCoreApplication.translate
        Filters.setWindowTitle(_translate("Filters", "Music Search System | Search Filters"))
        self.label_2.setText(_translate("Filters", "Album"))
        self.label.setText(_translate("Filters", "Artist"))
        self.label_3.setText(_translate("Filters", "Song"))
        self.label_4.setText(_translate("Filters", "Release date"))
        self.label_6.setText(_translate("Filters", "Filters"))
        self.Search.setText(_translate("Filters", "Search"))
        self.Add.setText(_translate("Filters", "Request from\nexternal"))
        self.label_5.setText(_translate("Filters", "Genre"))
        self.Release_date.setDisplayFormat(_translate("Filters", "yyyy-mm-dd"))
        self.load_Genres()

    def load_Genres(self):
        print("Loading genres...")

        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='YAELfvk5Jgt8qRTc',
                                     database='Music_Search_System',
                                     charset='utf8mb4',
                                     cursorclass=pymysql.cursors.DictCursor)

        with connection:
            data = select(connection, '*', 'Genres')
            for x in data:
                self.Genre.addItem(x['Genre_name'])
            
            connection.commit()

    def search(self):
        song = None
        artist = None
        album = None
        release_date = None
        genre = None
        song_name = ''
        if(not self.Song.text() == ''):
            song = self.Song.text()
            song = song.replace('(', '\(')
            song = song.replace (')', '\)')
        if(not self.Artist.text() == ''):
            artist = self.Artist.text()
        if(not self.Album.text() == ''):
            album = self.Album.text()
        if(self.Release_date.isEnabled() == True):
            release_date = self.Release_date.text()
        if(self.Genre.isEnabled() == True):
            genre = self.Genre.currentText()

        if(song == artist == album == genre == release_date == 0):
            buttonReply = QMessageBox.about(self, "Error", "No search parameters supplied.")

        print("Searching...")
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='YAELfvk5Jgt8qRTc',
                                     database='Music_Search_System',
                                     charset='utf8mb4',
                                     cursorclass=pymysql.cursors.DictCursor)
        data = ''
        with connection:
            #Honestly, don't try to look following coding hell
            #I know, that this code isn't the best, but I'll fix it someday.
            #For now, I need simply working hell :)
            #I already see similar parts, but I need more time to make it better
            """
            if  ( song == 1 and artist == 1 and album == 1 and release_date == 1 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums, Genres',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album and Songs.ID_Genre = Genres.ID'+
                                                            'and regexp_like(Songs.Name, %s) and regexp_like(Authors.Name, %s) and regexp_like(Albums.Name, %s) and Release_date like %s and Genres.Genre_name like %s', 
                                                            (".*("+song_name+").*",
                                                             ".*("+self.Artist.text()+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Release_date.text(),
                                                             self.Genre.currentText()))
            elif( song == 1 and artist == 1 and album == 1 and release_date == 1 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Songs.Name, %s) and regexp_like(Authors.Name, %s) and regexp_like(Albums.Name, %s) and Release_date like %s', 
                                                            (".*("+song_name+").*",
                                                             ".*("+self.Artist.text()+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Release_date.text()))
            elif( song == 1 and artist == 1 and album == 1 and release_date == 0 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums, Genres',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album and Genres.ID = Songs.ID_Genre '+
                                                            'and regexp_like(Songs.Name, %s) and regexp_like(Authors.Name, %s) and regexp_like(Albums.Name, %s) and Genres.Genre_name like %s', 
                                                            (".*("+song_name+").*",
                                                             ".*("+self.Artist.text()+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Genre.currentText()))
            elif( song == 1 and artist == 1 and album == 1 and release_date == 0 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Songs.Name, %s) and regexp_like(Authors.Name, %s) and regexp_like(Albums.Name, %s)', 
                                                            (".*("+song_name+").*",
                                                             ".*("+self.Artist.text()+").*",
                                                             ".*("+self.Album.text()+").*"))
            elif( song == 1 and artist == 1 and album == 0 and release_date == 1 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Genres', 'Authors.ID = Songs.ID_Author and Genres.ID = Songs.ID_Genre '+
                                                             'and regexp_like(Songs.Name, %s) and regexp_like(Authors.Name, %s) and Release_date like %s and Genres.Genre_name like %s', 
                                                             (".*("+song_name+").*",
                                                              ".*("+self.Artist.text()+").*",
                                                              self.Release_date.text(),
                                                              self.Genre.currentText()))
            elif( song == 1 and artist == 1 and album == 0 and release_date == 1 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs join Authors on Authors.ID = Songs.ID_Author',
                                                             'regexp_like(Songs.Name, %s) and regexp_like(Authors.Name, %s) and Release_date like %s', 
                                                             (".*("+song_name+").*",
                                                              ".*("+self.Artist.text()+").*",
                                                              self.Release_date.text()))
            elif( song == 1 and artist == 1 and album == 0 and release_date == 0 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Genres', 'Authors.ID = Songs.ID_Author and Genres.ID = Songs.ID_Genre '+
                                                             'and regexp_like(Songs.Name, %s) and regexp_like(Authors.Name, %s) and Genres.Genre_name like %s', (".*("+song_name+").*", ".*("+self.Artist.text()+").*", self.Genre.currentText()))
            elif( song == 1 and artist == 1 and album == 0 and release_date == 0 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs join Authors on Authors.ID = Songs.ID_Author',
                                                             'regexp_like(Songs.Name, %s) and regexp_like(Authors.Name, %s)', (".*("+song_name+").*", ".*("+self.Artist.text()+").*"))
            elif( song == 1 and artist == 0 and album == 1 and release_date == 1 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Genres, Songs_in_albums, Albums',
                                                            'Genres.ID = Songs.ID_Genre and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Songs.Name, %s) and regexp_like(Albums.Name, %s) and Release_date like %s and Genres.Genre_name like %s', 
                                                            (".*("+song_name+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Release_date.text(),
                                                             self.Genre.currentText()))
            elif( song == 1 and artist == 0 and album == 1 and release_date == 1 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Songs.Name, %s) and regexp_like(Albums.Name, %s) and Release_date like %s', 
                                                            (".*("+song_name+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Release_date.text()))
            elif( song == 1 and artist == 0 and album == 1 and release_date == 0 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Genres, Songs_in_albums, Albums',
                                                            'Genres.ID = Songs.ID_Genre and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Songs.Name, %s) and regexp_like(Albums.Name, %s) and Genres.Genre_name like %s', 
                                                            (".*("+song_name+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Genre.currentText()))
            elif( song == 1 and artist == 0 and album == 1 and release_date == 0 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Songs.Name, %s) and regexp_like(Albums.Name, %s)', 
                                                            (".*("+song_name+").*",
                                                             ".*("+self.Album.text()+").*"))
            elif( song == 1 and artist == 0 and album == 0 and release_date == 1 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Genres',
                                                            'Genres.ID = Songs.ID_Genre and Release_date like %s and regexp_like(Name, %s) and Genres.Genre_name like %s', 
                                                            (self.Release_date.text(),
                                                             '.*('+song_name+')*',
                                                             self.Genre.currentText()))
            elif( song == 1 and artist == 0 and album == 0 and release_date == 1 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs',
                                                            'Release_date like %s and regexp_like(Name, %s)', 
                                                            (self.Release_date.text(),
                                                             '.*('+song_name+')*'))
            elif( song == 1 and artist == 0 and album == 0 and release_date == 0 and genre == 1): 
                data = select_where(connection, '*', 'Songs, Genres', 'Genres.ID = Songs.ID_Genre and regexp_like(Name, %s) and Genres.Genre_name like %s', (".*("+song_name+").*", self.Genre.currentText()))
            elif( song == 1 and artist == 0 and album == 0 and release_date == 0 and genre == 0): 
                data = select_where(connection, '*', 'Songs', 'regexp_like(Name, %s)', (".*("+song_name+").*")) # %s resolves as '*string*' (with quotes)
            elif( song == 0 and artist == 1 and album == 1 and release_date == 1 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums, Genres',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album and Genres.ID = Songs.ID_Genre '+
                                                            'and regexp_like(Authors.Name, %s) and regexp_like(Albums.Name, %s) and Release_date like %s and Genres.Genre_name like %s', 
                                                            (".*("+self.Artist.text()+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Release_date.text(),
                                                             self.Genre.currentText()))
            elif( song == 0 and artist == 1 and album == 1 and release_date == 1 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Authors.Name, %s) and regexp_like(Albums.Name, %s) and Release_date like %s', 
                                                            (".*("+self.Artist.text()+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Release_date.text()))
            elif( song == 0 and artist == 1 and album == 1 and release_date == 0 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums, Genres',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album and Genres.ID = Songs.ID_Genre '+
                                                            'and regexp_like(Authors.Name, %s) and regexp_like(Albums.Name, %s) and Genres.Genre_name like %s', 
                                                            (".*("+self.Artist.text()+").*",
                                                             ".*("+self.Album.text()+").*",
                                                             self.Genre.currentText()))
            elif( song == 0 and artist == 1 and album == 1 and release_date == 0 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Authors.Name, %s) and regexp_like(Albums.Name, %s)', 
                                                            (".*("+self.Artist.text()+").*",
                                                             ".*("+self.Album.text()+").*"))
            elif( song == 0 and artist == 1 and album == 0 and release_date == 1 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Genres', 'Authors.ID = Songs.ID_Author and Genres.ID = Songs.ID_Genre '+
                                                             'and regexp_like(Authors.Name, %s) and Release_date like %s and Genres.Genre_name like %s', 
                                                             (".*("+self.Artist.text()+").*",
                                                              self.Release_date.text(),
                                                              self.Genre.currentText()))
            elif( song == 0 and artist == 1 and album == 0 and release_date == 1 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs join Authors on Authors.ID = Songs.ID_Author',
                                                             'regexp_like(Authors.Name, %s) and Release_date like %s', 
                                                             (".*("+self.Artist.text()+").*",
                                                              self.Release_date.text()))
            elif( song == 0 and artist == 1 and album == 0 and release_date == 0 and genre == 1): 
                 data = select_where(connection, 'Songs.*', 'Songs, Authors, Genres', 'Authors.ID = Songs.ID_Author and Genres.ID = Songs.ID_Genre '+
                                                            'and regexp_like(Authors.Name, %s) and Genres.Genre_name like %s', (".*("+self.Artist.text()+").*", self.Genre.currentText()))
            elif( song == 0 and artist == 1 and album == 0 and release_date == 0 and genre == 0): 
                 data = select_where(connection, 'Songs.*', 'Songs join Authors on Authors.ID = Songs.ID_Author',
                                                            'regexp_like(Authors.Name, %s)', (".*("+self.Artist.text()+").*"))
            elif( song == 0 and artist == 0 and album == 1 and release_date == 1 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Genres, Songs_in_albums, Albums',
                                                            'Genres.ID = Songs.ID_Genre and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'regexp_like(Albums.Name, %s) and Release_date like %s and Genres.Genre_name like %s', 
                                                            (".*("+self.Album.text()+").*",
                                                             self.Release_date.text(),
                                                             self.Genre.currentText()))
            elif( song == 0 and artist == 0 and album == 1 and release_date == 1 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'regexp_like(Albums.Name, %s) and Release_date like %s', 
                                                            (".*("+self.Album.text()+").*",
                                                             self.Release_date.text()))
            elif( song == 0 and artist == 0 and album == 1 and release_date == 0 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Songs_in_albums, Albums, Genres',
                                                            'Songs.ID_Genre = Genres.ID and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Albums.Name, %s) and Genres.Genre_name like %s', 
                                                            (".*("+self.Album.text()+").*",
                                                             self.Genre.currentText()))
            elif( song == 0 and artist == 0 and album == 1 and release_date == 0 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs, Authors, Songs_in_albums, Albums',
                                                            'Authors.ID = Songs.ID_Author and Songs_in_albums.ID_Song = Songs.ID and Albums.ID = Songs_in_albums.ID_Album '+
                                                            'and regexp_like(Albums.Name, %s)', 
                                                            (".*("+self.Album.text()+").*"))
            elif( song == 0 and artist == 0 and album == 0 and release_date == 1 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Genres',
                                                            'Songs.ID_Genre = Genres.ID and Genres.Genre_name like %s and Release_date like %s', 
                                                            (self.Genre.currentText(), self.Release_date.text()))
            elif( song == 0 and artist == 0 and album == 0 and release_date == 1 and genre == 0): 
                data = select_where(connection, 'Songs.*', 'Songs',
                                                            'Release_date like %s', 
                                                            (self.Release_date.text()))
            elif( song == 0 and artist == 0 and album == 0 and release_date == 0 and genre == 1): 
                data = select_where(connection, 'Songs.*', 'Songs, Genres',
                                                            'Songs.ID_Genre = Genres.ID and Genres.Genre_name like %s', 
                                                            (self.Genre.currentText()))
            """
            # I'll left it there for now
            # I don't need it anymore, because I have procedure inside database (see database_functions.sql)
            with connection.cursor() as cursor:
                #Syntax: search_song(author, album, song, release_date, genre)
                sql = ("call search(%s, %s, %s, %s, %s)")
                cursor.execute(sql,(artist,album,song,release_date,genre))
                data = cursor.fetchall()
            connection.commit()
        if(type(data) == tuple):    ### QuickFix: for no results
            #I'm trying to connect to my script to add song, if it isn't in my database
            #Adding request to search in external database and add to my own
            buttonReply = QMessageBox.question(self, "Error" , "This song isn't found in local database.\nDo you want to search in external database?")
            if buttonReply == QMessageBox.Yes:
                self.request()

        else:
            self.switch_window.emit(data)

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Filters = QtWidgets.QWidget()
    ui = Ui_Filters()
    ui.setupUi(Filters)
    Filters.show()
    sys.exit(app.exec_())
