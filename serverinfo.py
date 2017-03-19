#coding=utf8

posturl = 'http://your.domain.name/serverinfo.php'
server_id = 1

import sys
import os 

import atexit
import time 
import psutil
import urllib
import urllib2

def postdata(load, cpu, u, d, n):
    para_data = {}
    para_data['id']=server_id
    para_data['method']='update'
    para_data['load']=load
    para_data['cpu']=cpu
    para_data['upload']=u
    para_data['download']=d
    para_data['connections']=n
    print '发送的数据:'+str(para_data)
    para_data=urllib.urlencode(para_data)
    
    f = urllib2.Request(posturl, data=para_data)
    f.add_header('User-Agent', 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:26.0) Gecko/20100101 Firefox/26.0')
    try:
        f = urllib2.urlopen(f,timeout=3)
        f.read(1)
    except urllib2.URLError, e: 
        if hasattr(e,"reason"):
            print "Failed to reach the server"
            print "The reason:",e.reason
        elif hasattr(e,"code"):
            print "The server couldn't fulfill the request"
            print "Error code:",e.code
            print "Return content:",e.read()
    else:
        pass
    del f
    
    return ""
    
def bytes2human(n):
        """   
        >>> bytes2human(10000)   
        '9.8 K'   
        >>> bytes2human(100001221)   
        '95.4 M'   
        """    
        symbols = ('K', 'M', 'G', 'T', 'P', 'E', 'Z', 'Y')    
        prefix = {}    
        for i, s in enumerate(symbols):    
                prefix[s] = 1 << (i+1)*10    
        for s in reversed(symbols):    
                if n >= prefix[s]:    
                        value = float(n) / prefix[s]    
                        return '%.2f %s' % (value, s)    
        return '%.2f B' % (n)
        

def load_stat():
    loadavg = {}
    if os.path.exists("/proc/loadavg")  == True:
        f = open("/proc/loadavg")
        con = f.read().split()
        f.close()
        if len(con) >= 4:
            loadavg['lavg_1']=con[0]
            loadavg['lavg_5']=con[1]
            loadavg['lavg_15']=con[2]
            loadavg['nr']=con[3]
            loadavg['last_pid']=con[4]
        else:
            loadavg['lavg_1']="0.00"
            loadavg['lavg_5']="0.00"
            loadavg['lavg_15']="0.00"
            loadavg['nr']="1/25"
            loadavg['last_pid']="0"
    else:
        loadavg['lavg_1']="0.00"
        loadavg['lavg_5']="0.00"
        loadavg['lavg_15']="0.00"
        loadavg['nr']="1/25"
        loadavg['last_pid']="0"
    return loadavg 

def usernum():
    if os.path.exists('/var/log/ssnum')  == True:  #用户数文件存在
        file=open("/var/log/ssnum",'r')    #读取文件
        for value1 in file.readlines()[:1]:
            file.close()
            if value1[:value1.find("\n")] != "":
                return value1[:value1.find("\n")] #把字符串变成数字
            else:
                if value1[:value1.find("\r\n")] != "":
                    return value1[:value1.find("\r\n")]
                else:
                    return "0"
    else:
        return "0"
	
while 1:
    time.sleep(2)
    tol = psutil.net_io_counters()
    cpu = str(psutil.cpu_percent(1))+'%'
    cul = psutil.net_io_counters()
    load = load_stat()['lavg_1']
    upload = bytes2human(cul[0] - tol[0])+'/S'
    download = bytes2human(cul[1] - tol[1])+'/S'
    connections = usernum()
	
    os.system("clear")
    print 'CPU'+str(cpu)
    print '上传速度：'+ upload
    print '下载速度：'+download
    print '一分钟负载:'+load
    print '用户数:'+ connections
    
    postdata(load, cpu, upload, download, connections)
