#!/usr/bin/python3.8
import pathlib
import json
import base64
import requests
import re
import string
import sys
import os

def pa(t,lo=0):
    ret={}
    e=t.copy()
    for s in ['servers','expired','sig','thumbnail','hash','id','ids','ping']:
        e.pop(s,None)
    if lo:
        return e
    for s in e:
        i,k,p=fa(e[s],t["servers"])
        ret[s]={'key':k,'iv':i,'playlist':p}
    return ret

def fa(t,e):
    n="#EXTM3U\n"
    n+="#EXT-X-VERSION:4\n"
    n+="#EXT-X-PLAYLIST-TYPE:VOD\n"
    n+="#EXT-X-TARGETDURATION:"+str(t['duration'])+"\n"
    n+="#EXT-X-MEDIA-SEQUENCE:0\n"
    n+="#EXT-X-HASH:"+t['hash']+"\n"
    key=base64.b64decode(t['hash']+'==')
    iv=t['iv']
    n+="#EXT-X-HASH:"+t['hash']+"\n"
    n+='#EXT-X-KEY:METHOD=AES-128,URI="key.dat",IV='+iv
    o=len(e)
    i=0
    r=0
    o=None
    if 'id' in t:
        o=t['id']
    a=None
    if 'id' in t:
        a=t['ids']
    s=None
    if 'expired' in t:
        s=t['expired']
    elif 'sig' in t:
        s=t['sig']
    c=None
    if 'datas' in t:
        c=t['datas']
    u=t['ranges']
    l=len(u)
    if c is not None:
        for h in u:
            f=None
            d=c[h]['file']
            for p in u[h]:
                y=None
                if l<=h+p+1:
                    if l<=p+1:
                        y=c[0]['file']
                    else:
                        y=c[p+1]['file']
                else:
                    y=c[h+p+1]['file']
                if i < o:
                    f=e[i]
                    i+=1
                else:
                    i=1,
                    f=e[0]
                a=u[h][p],
                f="https://"+f,
                n+="#EXTINF:"+t["extinfs"][r]+",\n"
                n+="#EXT-X-BYTERANGE:"+a+"\n",
                if s:
                    n+=(f+"/")+s+"/"+d+"/"+a+"/"+y+"\n"
                else:
                    n+=n+(f+"/")+r+"/"+d+"/"+a+"/"+y+"\n",
                r+=1
        n+="#EXT-X-ENDLIST"
    elif a:
        for ih,h in enumerate(u):
            d=a[ih]
            for ip,p in enumerate(h):
                y=None
                if l<=ih+ip+1:
                    if l<=ip+1:
                        y=a[0]
                    else:
                        y=a[ip+1]
                else:
                    y=a[ih + ip + 1]
                if isinstance(e["redirect"],list):
                    if i < len(e["redirect"]):
                        c = e["redirect"][i]
                        i+=1
                    else:
                        i=1
                        c=e["redirect"][0]
                else:
                    c = e["redirect"]
                n+="#EXTINF:"+t["extinfs"][r]+",\n"
                if 1 < len(h):
                    n+="#EXT-X-BYTERANGE:"+h[ip]+"\n"
                # print("https://%s/redirect/%s/%s/%s/%s"%(c,s,o,d,y))
                n+="https://"+c+"/redirect/"+s+"/"+o+"/"+d+"/"+y+"\n"
                r+=1;
        n+="#EXT-X-ENDLIST"
    return (iv,key,n)

def getStream(slug,apikey,stream=None):
    print("Retriving Playlist...")
    r = requests.post(url="https://multi.idocdn.com/vip",headers={"Content-Type": "application/x-www-form-urlencoded"},data="key="+apikey+"&type=slug&value="+slug)
    data=json.loads(r.text)
    if stream:
        if stream not in pa(data,1):
            print("Invalid Stream Type")
            exit()
        print("Generating Playlist...")
        data=pa(data)
        data=data[stream]
        print("Writing key.dat...")
        with open('key.dat','wb') as b:
            b.write(data["key"])
        print("Writing output.m3u8...")
        with open('output.m3u8','w') as b:
            b.write(data["playlist"])
    else:
        data=pa(data,1)
        print("Available Streams:")
        for s in data.keys():
            print(s)
        print('')
        exit()

if len(sys.argv)!=2 and len(sys.argv)!=3:
    print("Usage: "+sys.argv[0]+" https://watchcartoonsonline.eu/<Video> <Stream>")
    print("Note: Stream is listed when left blank.")
    exit()


print("Retriving URL...")
r = requests.get(sys.argv[1])
data=r.text.translate(str.maketrans('', '', string.whitespace))
search = re.compile(r".*{jQuery.ajax\({type:\"GET\",dataType:\"html\",url:\"(.*)\",data:{poster:\"(.*)\",link:\"([^\"]*)\"},.*")
match=search.match(data)
url,poster,link=match.groups()
print("Retriving Video Player...")
print((url,poster,link))
r = requests.get(url+"?poster="+poster+"&link="+link)
data=r.text.translate(str.maketrans('', '', string.whitespace))
search = re.compile(r".*\"(https://watchcartoonsonline\.eu/hydapi\.php\?slug=[^\"]*).*")
# print(data)
match=search.match(data)
url=''.join(match.groups())
# print(slug)
print("Retriving Video Info...")
r = requests.get(url,headers={"referer": sys.argv[1]+'/'})
data=r.text.translate(str.maketrans('', '',string.whitespace))
search = re.compile(r".*<script>newPlayer\({.*\"key\":\"([^\"]*)\",\"type\":\"([^\"]*)\",\"value\":\"([^\"]*)\".*}\);</script>.*")
match=search.match(data)
key,type,value=match.groups()
if type=='slug':
    if len(sys.argv)==3:
        getStream(value,key,sys.argv[2])
    else:
        getStream(value,key)
    print("Done.")
    print("Play it: streamlink --http-header origin=https://watchcartoonsonline.eu "+pathlib.Path(os.path.abspath('output.m3u8')).as_uri()+" best")
else:
    print("Invalid Stream Type")
exit()
