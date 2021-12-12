from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import Qt
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

#For tables, where iterator field is ID
def resolve_data(field, data, table):
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='YAELfvk5Jgt8qRTc',
                                 database='Music_Search_System',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    result = ''
    with connection:
        result = select_where(connection, field+' as `result`', table, 'ID like %s', (data))
        connection.commit()
    
    return result[0]['result']

class Ui_Result(QtWidgets.QWidget):
    
    switch_window = QtCore.pyqtSignal()
    switch_window2 = QtCore.pyqtSignal(dict)
    res_data = ''

    def setupUi(self, Result, data):
        Result.setObjectName("Result")
        Result.resize(800, 600)
        Result.setMinimumSize(QtCore.QSize(800, 600))
        Result.setMaximumSize(QtCore.QSize(800, 600))
        self.pushButton = QtWidgets.QPushButton(Result)
        self.pushButton.setGeometry(QtCore.QRect(20, 10, 88, 34))
        self.pushButton.setObjectName("pushButton")
        self.tableView = QtWidgets.QTableView(Result)
        self.tableView.setGeometry(QtCore.QRect(20, 50, 751, 521))
        self.tableView.setObjectName("tableView")

        self.retranslateUi(Result)
        self.fillTable(data)
        QtCore.QMetaObject.connectSlotsByName(Result)

        self.pushButton.clicked.connect(self.switch_window.emit)
        self.tableView.doubleClicked.connect(self.handleDoubleClick)

    def handleDoubleClick(self, click):
        self.switch_window2.emit(self.res_data[click.row()])

    def fillTable(self, data):
        data_out = pd.DataFrame(columns=['ID','Name','Author','Release date','Genre'])       

        Author = ''
        Genre = ''
        
        for x in data:
            x['ID_Author'] = resolve_data('Name', x['ID_Author'], 'Authors')
            x['ID_Genre'] = resolve_data('Genre_name', x['ID_Genre'], 'Genres')
            x['ID_Lyrics'] = resolve_data('URL', x['ID_Lyrics'], 'Lyrics')

            data_out = data_out.append({'ID': x['ID'],
                                        'Name': x['Name'],
                                        'Author': x['ID_Author'], #resolved
                                        'Release date': x['Release_date'],
                                        'Genre': x['ID_Genre']},  #resolved
                                        ignore_index=True)

        self.res_data = data

        self.model = TableModel(data_out)
        self.tableView.setModel(self.model)

    def retranslateUi(self, Result):
        _translate = QtCore.QCoreApplication.translate
        Result.setWindowTitle(_translate("Result", "Music Search System | Result"))
        self.pushButton.setText(_translate("Result", "Back to filters"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Result = QtWidgets.QWidget()
    ui = Ui_Result()
    ui.setupUi(Result)
    Result.show()
    sys.exit(app.exec_())
