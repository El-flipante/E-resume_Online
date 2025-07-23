from app.controllers.application import Application
from bottle import Bottle, route, run, request, static_file
from bottle import redirect, template, response
from bottle import Bottle, route, run, request, static_file
from bottle import redirect, template, response, TEMPLATE_PATH, abort  # Adicione TEMPLATE_PATH aqui
import os
TEMPLATE_PATH.insert(0, os.path.abspath('./app/views/html'))
from geventwebsocket.handler import WebSocketHandler

app = Bottle()
ctl = Application()
# Lista global de conexões
clients = set()


#-----------------------------------------------------------------------------
# Rotas:

@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')

@app.route('/helper')
def helper(info= None):
    return ctl.render('helper')


#-----------------------------------------------------------------------------
# Suas rotas aqui:

@app.route('/pagina', methods=['GET'])
@app.route('/pagina/<parameter>', methods=['GET'])
def action_curriculo(parameter=None): 
    if not parameter:
        return ctl.render('pagina') 
    else:
        return ctl.render('pagina', parameter) 
    
@app.route('/portal', method='GET')
def login():
    return ctl.render('portal')

@app.route('/adm')
def admin():
    return template('adm')

@app.route('/portal', method='POST')
def action_portal():
    username = request.forms.get('username')
    password = request.forms.get('password')
    session_id, username, user_type = ctl.authenticate_user(username, password)
    if session_id:
        response.set_cookie('session_id', session_id, httponly=True, secure=True, max_age=3600)
        if user_type == "admin":
            return redirect('/adm')
        else:
            return redirect(f'/pagina/{username}')
    else:
        return redirect('/portal')
    
@app.route('/logout', method='POST')
def logout():
    ctl.logout_user()
    response.delete_cookie('session_id')
    redirect('/helper')


@app.route('/websocket')
def handle_websocket():
    wsock = request.environ.get('wsgi.websocket')
    if not wsock:
        abort(400, 'Expected WebSocket request.')

    # Adiciona à lista de conexões
    clients.add(wsock)
    try:
        while True:
            message = wsock.receive()
            if message is None:
                break

            # Envia para todos os clientes conectados
            for client in clients:
                try:
                    client.send(f"Você disse: {message}")
                except:
                    pass
    finally:
        clients.remove(wsock)



#-----------------------------------------------------------------------------


if __name__ == '__main__':
    run(app=app, host='0.0.0.0', port=8080, 
        server='gevent', handler_class=WebSocketHandler, debug=True)
