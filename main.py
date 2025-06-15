import os
import threading
import webview
from pywebview_bridge import Api

def run_server():
    """启动一个简单的HTTP服务器来提供Vue应用"""
    import http.server
    import socketserver
    
    PORT = 8000
    Handler = http.server.SimpleHTTPRequestHandler
    
    # 切换到Vue打包后的dist目录
    os.chdir('frontend/dist')
    
    with socketserver.TCPServer(("", PORT), Handler) as httpd:
        print(f"服务器运行在端口 {PORT}")
        httpd.serve_forever()

if __name__ == '__main__':
    # 创建API实例用于与JavaScript通信
    api = Api()
    
    # 启动服务器线程
    server_thread = threading.Thread(target=run_server, daemon=True)
    server_thread.start()
    
    # 创建一个webview窗口
    window = webview.create_window(
        'Vue App',
        'http://localhost:8000',  # 指向Vue应用的URL
        # 'http://localhost:5173/',#测试模式
        js_api=api,  # 注册API以便JavaScript可以调用Python方法
        width=800,
        height=600,
        resizable=True
    )
    
    # 设置JavaScript到Python的消息回调
    api.set_receive_callback(lambda msg: print(f"收到来自Vue的消息: {msg}"))
    
    # 启动webview
    webview.start(debug=True)    