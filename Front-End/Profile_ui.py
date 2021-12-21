from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtCore import QRect
from PyQt5.QtWidgets import QMessageBox, QDesktopWidget, QCheckBox
from SQL_functions import *
from search_genius import *


class Ui_Profile(QtWidgets.QWidget):

    switch_window = QtCore.pyqtSignal(str)

    login = ''
    password = ''
    email = ''
    nickname = ''
    id = 0

    def setupUi(self, Filters, login):
        self.login = login

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
        self.Nickname = QtWidgets.QLineEdit(Filters)
        self.Nickname.setGeometry(QtCore.QRect(180, 110, 251, 32))
        self.Nickname.setObjectName("Nickname")
        self.Email = QtWidgets.QLineEdit(Filters)
        self.Email.setGeometry(QtCore.QRect(180, 160, 251, 32))
        self.Email.setObjectName("Email")
        self.Password = QtWidgets.QLineEdit(Filters)
        self.Password.setGeometry(QtCore.QRect(180, 210, 251, 32))
        self.Password.setEchoMode(QtWidgets.QLineEdit.PasswordEchoOnEdit)
        self.Password.setObjectName("Password")
        self.Phone_num = QtWidgets.QLineEdit(Filters)
        self.Phone_num.setGeometry(QtCore.QRect(180, 260, 251, 32))
        self.Phone_num.setObjectName("Phone_num")
        self.Last_login = QtWidgets.QLineEdit(Filters)
        self.Last_login.setGeometry(QtCore.QRect(180, 310, 251, 32))
        self.Last_login.setReadOnly(True)
        self.Last_login.setObjectName("Last_login")
        self.label = QtWidgets.QLabel(Filters)
        self.label.setGeometry(QtCore.QRect(60, 110, 101, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label.setFont(font)
        self.label.setObjectName("label")
        self.label_3 = QtWidgets.QLabel(Filters)
        self.label_3.setGeometry(QtCore.QRect(62, 210, 101, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label_3.setFont(font)
        self.label_3.setObjectName("label_3")
        self.label_4 = QtWidgets.QLabel(Filters)
        self.label_4.setGeometry(QtCore.QRect(10, 260, 151, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label_4.setFont(font)
        self.label_4.setObjectName("label_4")
        self.label_6 = QtWidgets.QLabel(Filters)
        self.label_6.setGeometry(QtCore.QRect(170, 39, 121, 41))
        font = QtGui.QFont()
        font.setPointSize(18)
        self.label_6.setFont(font)
        self.label_6.setObjectName("label_6")
        self.confirm = QtWidgets.QPushButton(Filters)
        self.confirm.setGeometry(QtCore.QRect(260, 470, 171, 61))
        font = QtGui.QFont()
        font.setPointSize(18)
        self.confirm.setFont(font)
        self.confirm.setObjectName("pushButton")
        self.discard = QtWidgets.QPushButton(Filters)
        self.discard.setGeometry(QtCore.QRect(40, 470, 171, 61))
        font = QtGui.QFont()
        font.setPointSize(18)
        self.discard.setFont(font)
        self.discard.setObjectName("pushButton")
        self.label_5 = QtWidgets.QLabel(Filters)
        self.label_5.setGeometry(QtCore.QRect(62, 310, 101, 30))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.label_5.setFont(font)
        self.label_5.setObjectName("label_5")
        self.Email.raise_()
        self.label_2.raise_()
        self.Password.raise_()
        self.label.raise_()
        self.label_3.raise_()
        self.label_4.raise_()
        self.label_6.raise_()
        self.Nickname.raise_()
        self.confirm.raise_()
        self.discard.raise_()
        self.label_5.raise_()
        self.Phone_num.raise_()
        self.Last_login.raise_()

        self.retranslateUi(Filters)
        self.find_data()
        self.location_on_the_screen()
        QtCore.QMetaObject.connectSlotsByName(Filters)

        self.discard.clicked.connect(self.commit_clean)
        self.confirm.clicked.connect(self.commit)

    def check_nick(self, connection):
        with connection.cursor() as cursor:
            res = select_where(connection, 'ID', 'Users', 'Nickname = %s', self.Nickname.text())
            if (res == ()):
                return 1
            else: 
                return 0
    
    def check_email(self, connection):
        with connection.cursor() as cursor:
            res = select_where(connection, 'ID', 'Users', 'Email = %s', self.Email.text())
            if (res == ()):
                return 1
            else: 
                return 0

    def commit(self):
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='YAELfvk5Jgt8qRTc',
                                     database='Music_Search_System',
                                     charset='utf8mb4',
                                     cursorclass=pymysql.cursors.DictCursor)

        phone = self.Phone_num.text()
        phone.replace('+', '')
        try:
            string_int = int(phone)
        except ValueError:
            print('Please enter an integer')
            self.Phone_num.setText('')
        
        with connection:
            if(not self.Nickname.text() == self.nickname and self.check_nick(connection) == 1):
                update(connection, 'Users', 'Nickname = %s', 'ID = %s', (self.Nickname.text(), self.id))
            if(not self.Email.text() == self.email and self.check_email(connection) == 1):
                update(connection, 'Users', 'Email = %s', 'ID = %s', (self.Email.text(), self.id))
            if(not self.Password.text() == ''):
                update(connection, 'Users', 'Password = %s', 'ID = %s', (self.Password.text(), self.id))
            if(not self.Phone_num.text() == ''):
                update(connection, 'Users', 'Phone = %s', 'ID = %s', (phone, self.id))
            connection.commit()
        self.switch_window.emit(self.Nickname.text())

    def commit_clean(self):
        self.switch_window.emit(self.Nickname.text())

    def find_data(self):
        connection = pymysql.connect(host='localhost',
                                     user='root',
                                     password='YAELfvk5Jgt8qRTc',
                                     database='Music_Search_System',
                                     charset='utf8mb4',
                                     cursorclass=pymysql.cursors.DictCursor)

        with connection:
            result = select_where(connection, '*', 'Users', 'Nickname = %s', self.login)[0]
            connection.commit()
        self.id = result['ID']
        self.Nickname.setText(result['Nickname'])
        self.nickname = result['Nickname']
        self.Email.setText(result['Email'])
        self.email = result['Email']
        self.Phone_num.setText(str(result['Phone']))
        self.Last_login.setText(str(result['Last_login']))
        self.password = result['Password']

    
    def location_on_the_screen(self):
        ag = QDesktopWidget().availableGeometry()
        widget = self.geometry()
        x = ag.width()/2 - widget.width()/2
        y = ag.height()/2 - widget.height()/2
        self.move(x, y)

    def retranslateUi(self, Filters):
        _translate = QtCore.QCoreApplication.translate
        Filters.setWindowTitle(_translate("Filters", "Music Search System | Profile"))
        self.label_2.setText(_translate("Filters", "Email"))
        self.Password.setPlaceholderText(_translate("Filters", "********"))
        self.label.setText(_translate("Filters", "Nickname"))
        self.label_3.setText(_translate("Filters", "Password"))
        self.label_4.setText(_translate("Filters", "Phone number"))
        self.label_6.setText(_translate("Filters", "Edit profile"))
        self.confirm.setText(_translate("Filters", "Commit"))
        self.discard.setText(_translate("Filters", "Discard\nchanges"))
        self.label_5.setText(_translate("Filters", "Last login"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Filters = QtWidgets.QWidget()
    ui = Ui_Filters()
    ui.setupUi(Filters)
    Filters.show()
    sys.exit(app.exec_())
