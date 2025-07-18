from app.models.curriculo import UserAccount
import json
import uuid

class DataRecord():

    def __init__(self):
        self.__user_accounts = []
        self.__admin_accounts = []
        self.__authenticated_users = {}
        self.read()

    def read(self):
        # Usuários comuns
        try:
            with open("app/controllers/db/database.json", "r") as arquivo_json:
                user_data = json.load(arquivo_json)
                self.__user_accounts = [UserAccount(**data) for data in user_data]
        except FileNotFoundError:
            self.__user_accounts.append(UserAccount('Guest', '010101'))

        # Usuários admin
        try:
            with open("app/controllers/db/adm_database.json", "r") as arquivo_json:
                admin_data = json.load(arquivo_json)
                self.__admin_accounts = [UserAccount(**data) for data in admin_data]
        except FileNotFoundError:
            pass


    def getCurrentUser(self,session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id]
        else:
            return None


    def getUserName(self,session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id].username
        else:
            return None


    def getUserSessionId(self, username):
        for session_id in self.__authenticated_users:
            if username == self.__authenticated_users[session_id].username:
                return session_id
        return None  # Retorna None se o usuário não for encontrado


    def checkUser(self, username, password):
        # Verifica usuários comuns
        for user in self.__user_accounts:
            if user.username == username and user.password == password:
                session_id = str(uuid.uuid4())
                self.__authenticated_users[session_id] = user
                return session_id, "user"
        # Verifica admins
        for admin in self.__admin_accounts:
            if admin.username == username and admin.password == password:
                session_id = str(uuid.uuid4())
                self.__authenticated_users[session_id] = admin
                return session_id, "admin"
        return None, None

    def logout(self, session_id):
        if session_id in self.__authenticated_users:
            del self.__authenticated_users[session_id] # Remove o usuário logado