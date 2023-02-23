#!/usr/bin/env python3
from PySide2 import QtCore, QtGui, QtWidgets
from PySide2.QtCore import Qt
from PySide2.QtCore import QRect
from PySide2.QtWidgets import QMessageBox, QDesktopWidget, QCheckBox

import warnings
warnings.simplefilter(action="ignore", category=FutureWarning)

import pandas as pd
from SQL_functions import *
import pymysql


class TableModel(QtCore.QAbstractTableModel):

    def __init__(self, data):
        super(TableModel, self).__init__()
        self._data = data

    def data(self, index, role):
        if role == Qt.DisplayRole:
            value = self._data.iloc[index.row(), index.column()]
            return str(value)

    def rowCount(self, index):
        return self._data.shape[0]

    def columnCount(self, index):
        return self._data.shape[1]

    def headerData(self, section, orientation, role):
        # section is the index of the column/row.
        if role == Qt.DisplayRole:
            if orientation == Qt.Horizontal:
                return str(self._data.columns[section])

            if orientation == Qt.Vertical:
                return str(self._data.index[section])


def getTable(table):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='YAELfvk5Jgt8qRTc',
                                 database='Music_Search_System',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    result = ''
    with connection:
        result = select(connection, "*", table)
        connection.commit()

    return result


class Ui_Moderator(QtWidgets.QWidget):
    switch_window = QtCore.Signal(str)
    res_data = ''
    songs = []
    users = []
    authors = []

    def setupUi(self, Moderator):
        Moderator.setObjectName("Moderator")
        Moderator.resize(800, 600)
        Moderator.setMinimumSize(QtCore.QSize(800, 600))
        Moderator.setMaximumSize(QtCore.QSize(800, 600))
        self.pushButton = QtWidgets.QPushButton(Moderator)
        self.pushButton.setGeometry(QtCore.QRect(20, 10, 88, 34))
        self.pushButton.setObjectName("pushButton")
        self.tableView = QtWidgets.QTableView(Moderator)
        self.tableView.setGeometry(QtCore.QRect(20, 50, 751, 521))
        self.tableView.setObjectName("tableView")
        self.tableView.setSizeAdjustPolicy(QtWidgets.QAbstractScrollArea.AdjustToContents)

        self.retranslateUi(Moderator)
        self.songs = getTable("Songs")
        self.users = getTable("Users")
        self.authors = getTable("Authors")
        self.fillTable(getTable("YT_Comments"))
        self.tableView.resizeColumnsToContents()
        self.location_on_the_screen()
        QtCore.QMetaObject.connectSlotsByName(Moderator)

        self.pushButton.clicked.connect(self.back_to_profile)
        self.tableView.doubleClicked.connect(self.handleDoubleClick)

    def back_to_profile(self):
        self.switch_window.emit(None)

    def location_on_the_screen(self):
        ag = QDesktopWidget().availableGeometry()
        widget = self.geometry()
        x = int(ag.width() / 2 - widget.width() / 2)
        y = int(ag.height() / 2 - widget.height() / 2)
        self.move(x, y)

    def handleDoubleClick(self, click):
        clickRow = self.data_out.get("ID")[click.row()]

        if QMessageBox.question(self, "Delete", "Are you sure you want to delete this comment?\nThis action is not revertable.") == QMessageBox.Yes:
            connection = pymysql.connect(host='localhost',
                                         user='root',
                                         password='YAELfvk5Jgt8qRTc',
                                         database='Music_Search_System',
                                         charset='utf8mb4',
                                         cursorclass=pymysql.cursors.DictCursor)
            with connection:
               update(connection, "YT_Comments", "Removed = true", "ID = %s", (clickRow))
               connection.commit()

            print("Yes clicked")
            self.fillTable(getTable("YT_Comments"))


    def fillTable(self, data):
        self.data_out = pd.DataFrame(columns=['ID', 'Video', 'Username', 'Comment'])

        for x in data:
           
            if x["Removed"] == True:
                continue
                
            video_name = ''
            video_authors = ''
            for song in self.songs:
                if song['ID_Video'] == x['ID_Video']:
                    if len(video_name) == 0:
                        video_name = song["Name"]
                    video_authors = video_authors + self.authors[song["ID_Author"]-1]["Name"] + ", "


            username = self.users[x['ID_User']-1]["Nickname"]

            self.data_out = self.data_out.append({'ID': x['ID'], 
                                        'Video': video_name + " by " + video_authors[:-2],
                                        'Username': username,
                                        'Comment': x['Message']},
                                       ignore_index=True)

        self.res_data = data

        self.model = TableModel(self.data_out)
        self.tableView.setModel(self.model)

    def retranslateUi(self, Moderator):
        _translate = QtCore.QCoreApplication.translate
        Moderator.setWindowTitle(_translate("Moderator", "Music Search System | Moderate comments"))
        self.pushButton.setText(_translate("Moderator", "Back to profile"))


if __name__ == "__main__":
    import sys

    app = QtWidgets.QApplication(sys.argv)
    Moderator = QtWidgets.QWidget()
    ui = Ui_Moderator()
    ui.setupUi(Moderator)
    Moderator.show()
    sys.exit(app.exec_())
