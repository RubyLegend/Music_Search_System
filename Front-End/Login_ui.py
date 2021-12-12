from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QMessageBox, QDesktopWidget
from SQL_functions import *
import re

def check_credentials(login, password):
    ret = 0
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='YAELfvk5Jgt8qRTc',
                                 database='Music_Search_System',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    if(not re.match("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}\\b", login)):
        print("Wrong email")
        ret -= 1 
    else:
        with connection:
            result = select_where(connection, '*', '`Users`', 'Email = %s', login)
            if(result == ()):
                print("No such user in database.")
            else: ret += 1
            result = select_where(connection, '*', '`Users`', 'Email = %s and Password = %s', (login, password))
            if(result == ()):
                print("Wrong password.")
            else: ret += 1
            connection.commit()
    return ret

def register(login, password):
    ret = 0
    connection = pymysql.connect(host='localhost',
                                 user='root',
                                 password='YAELfvk5Jgt8qRTc',
                                 database='Music_Search_System',
                                 charset='utf8mb4',
                                 cursorclass=pymysql.cursors.DictCursor)
    if(not re.match("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}\\b", login)):
        print("Wrong email")
        ret -= 1 
    else:
        with connection:
            result = select_where(connection, '*', '`Users`', 'Email = %s', login)
            if(result == ()):
                it = int(select(connection,'count(*)', '`Users`')[0]['count(*)'])        
                result = insert(connection, '`Users`', '(%s, %s, %s, %s, 2, NULL, NULL)', (it+1, login, login, password))
                ret += 1
            connection.commit()
    
    return ret


class Ui_login(QtWidgets.QWidget):

    switch_window = QtCore.pyqtSignal(int)

    def setupUi(self, login):
        login.setObjectName("login")
        login.resize(476, 600)
        login.setMinimumSize(QtCore.QSize(476, 600))
        login.setMaximumSize(QtCore.QSize(476, 600))
        self.Login = QtWidgets.QLineEdit(login)
        self.Login.setGeometry(QtCore.QRect(160, 170, 251, 24))
        self.Login.setInputMask("")
        self.Login.setObjectName("Login")
        self.label = QtWidgets.QLabel(login)
        self.label.setGeometry(QtCore.QRect(100, 60, 291, 61))
        font = QtGui.QFont()
        font.setFamily("Liberation Serif")
        font.setPointSize(17)
        font.setKerning(True)
        self.label.setFont(font)
        self.label.setAlignment(QtCore.Qt.AlignCenter)
        self.label.setObjectName("label")
        self.Pass = QtWidgets.QLineEdit(login)
        self.Pass.setGeometry(QtCore.QRect(160, 240, 251, 24))
        self.Pass.setEchoMode(QtWidgets.QLineEdit.Password)
        self.Pass.setObjectName("Pass")
        self.Login_Button = QtWidgets.QPushButton(login)
        self.Login_Button.setGeometry(QtCore.QRect(90, 450, 111, 41))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.Login_Button.setFont(font)
        self.Login_Button.setObjectName("Login_Button")
        self.Register = QtWidgets.QPushButton(login)
        self.Register.setGeometry(QtCore.QRect(280, 450, 111, 41))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.Register.setFont(font)
        self.Register.setObjectName("Register")
        self.Password_label = QtWidgets.QLabel(login)
        self.Password_label.setGeometry(QtCore.QRect(50, 240, 111, 16))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.Password_label.setFont(font)
        self.Password_label.setObjectName("Password_label")
        self.Login_label = QtWidgets.QLabel(login)
        self.Login_label.setGeometry(QtCore.QRect(90, 170, 61, 31))
        font = QtGui.QFont()
        font.setPointSize(16)
        self.Login_label.setFont(font)
        self.Login_label.setObjectName("Login_label")
        
        self.location_on_the_screen()
        
        self.retranslateUi(login)
        QtCore.QMetaObject.connectSlotsByName(login)
        
        self.Login.returnPressed.connect(self.LogMeIn)
        self.Pass.returnPressed.connect(self.LogMeIn)
        self.Login_Button.clicked.connect(self.LogMeIn)
        self.Register.clicked.connect(self.register)

    def location_on_the_screen(self):
        ag = QDesktopWidget().availableGeometry()
        widget = self.geometry()
        x = ag.width()/2 - widget.width()/2
        y = ag.height()/2 - widget.height()/2
        self.move(x, y)
    
    def register(self):
            if self.Login.text() == '':
                buttonReply = QMessageBox.about(self, "Error", "Please, enter your login.")
                if buttonReply == QMessageBox.Ok:
                    print('OK clicked.')
            elif self.Pass.text() == '':
                buttonReply = QMessageBox.about(self, "Error", "No password entered.")
                if buttonReply == QMessageBox.Ok:
                    print('OK clicked.')
            else:
                result = register(self.Login.text(), self.Pass.text())
                if(result == -1):
                    buttonReply = QMessageBox.about(self, "Error", "Wrong email format.")
                    if buttonReply == QMessageBox.Ok:
                        print('OK clicked.')
                elif(result == 0):
                    buttonReply = QMessageBox.about(self, "Error", "There is already such user registered.\nLogin with your password instead.")
                    if buttonReply == QMessageBox.Ok:
                            print('OK clicked.')
                elif(result == 1):
                    buttonReply = QMessageBox.about(self, "Error", "Successfully registered. Now you can login.")
                    if buttonReply == QMessageBox.Ok:
                        print('OK clicked.')

    def LogMeIn(self):
            if self.Login.text() == '':
                buttonReply = QMessageBox.about(self, "Error", "Please, enter your login.")
                if buttonReply == QMessageBox.Ok:
                    print('OK clicked.')
            elif self.Pass.text() == '':
                buttonReply = QMessageBox.about(self, "Error", "No password entered.")
                if buttonReply == QMessageBox.Ok:
                    print('OK clicked.')
            else:
                login = self.Login.text()
                password = self.Pass.text()
                result = check_credentials(login, password)
                if(result == -1):
                    buttonReply = QMessageBox.about(self, "Error", "Wrong email format.")
                    if buttonReply == QMessageBox.Ok:
                        print('OK clicked.')
                elif(result == 0):
                    buttonReply = QMessageBox.about(self, "Error", "No such user found in database.")
                    if buttonReply == QMessageBox.Ok:
                        print('OK clicked.')
                elif(result == 1):
                    buttonReply = QMessageBox.about(self, "Error", "Wrong password.")
                    if buttonReply == QMessageBox.Ok:
                        print('OK clicked.')
                else:
                    print('Connection successfull.')
                    self.switch_window.emit(2)


    def retranslateUi(self, login):
        _translate = QtCore.QCoreApplication.translate
        login.setWindowTitle(_translate("login", "Form"))
        self.Login.setPlaceholderText(_translate("login", "Input your email here"))
        self.label.setText(_translate("login", "Welcome to \n"
"Music Search System"))
        self.Register.setText(_translate("login", "Register"))
        self.Pass.setPlaceholderText(_translate("login", "Input your password here"))
        self.Password_label.setText(_translate("login", "Password"))
        self.Login_label.setText(_translate("login", "Login"))
        self.Login_Button.setText(_translate("login", "Login"))


if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    login = QtWidgets.QWidget()
    ui = Ui_login()
    ui.setupUi(login)
    login.show()
    sys.exit(app.exec_())
