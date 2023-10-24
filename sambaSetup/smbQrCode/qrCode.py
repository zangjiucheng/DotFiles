# Importing library
import shutil
import qrcode 
from PIL import Image
import socket
import os
from time import sleep

smbSharePath = '/home/jiucheng/sambaShare'
mode = '2777'

def get_host_ip():
    """
    查询本机ip地址
    :return: ip
    """
    try:
        s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
        s.connect(('8.8.8.8', 80))
        ip = s.getsockname()[0]
    finally:
        s.close()

    return ip

def QrCodeShow():
    ip = 'smb://' + get_host_ip() + '/ThinkPad-Share'
    img = qrcode.make(ip)
    img.show() 

def prepareSMB():
    if os.path.exists(smbSharePath):
        shutil.rmtree(smbSharePath)
    os.mkdir(smbSharePath)
    print("Samba share path is: "+smbSharePath)
    print("Finish prepare Samba share path")
    sleep(1)
    os.system("sudo chmod "+mode+" -R "+smbSharePath)
    os.system("sudo ufw allow 445")
    os.system("sudo service smbd restart")
    os.system("sudo service nmbd restart")
    os.system("touch "+smbSharePath+"/Hello.txt") 
    print("Finish prepare Samba Server")


if __name__ == '__main__':
    prepareSMB()
    QrCodeShow()
