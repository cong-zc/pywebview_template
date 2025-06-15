import json

class Api:
    def __init__(self):
        self.receive_callback = None
        self.send_message = None

    def send(self, message):
        """接收来自JavaScript的消息"""
        print(f"收到来自Vue的消息: {message}")
        self.send_message = message
        # 可以在这里处理消息并返回响应
        return "Python已收到消息: " + message

    def set_receive_callback(self, callback):
        """设置接收消息的回调函数"""
        self.receive_callback = callback
    
    def receive(self):
        return "Python已收到消息: " + (self.send_message if self.send_message is not None else "")
